import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/nin_database.dart';
import 'package:drift/drift.dart';
import 'package:html/parser.dart' show parse;

class NinApiService {
  static const String baseUrl = 'https://nin-kode-api.artsdatabanken.no/v3.0';
  static const String webBaseUrl = 'https://artsdatabanken.no/naturtyper/natur-i-norge';

  Future<void> updateAllData(NinDatabase db, {bool deepSync = false}) async {
    await _updateTypes(db, deepSync: deepSync);
    await _updateVariables(db);
  }

  Future<void> _updateTypes(NinDatabase db, {bool deepSync = false}) async {
    final response = await http.get(Uri.parse('$baseUrl/typer/allekoder'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<NinType> types = [];
      
      void processType(Map<String, dynamic> item, String? parentId) {
        final kode = item['kode'] as Map<String, dynamic>;
        final id = kode['id'] as String;
        final langkode = kode['langkode'] as String?;
        
        types.add(NinType(
          id: id,
          navn: item['navn'] as String,
          kategori: item['kategori'] as String,
          parentId: parentId,
          ecosystnivaaNavn: item['ecosystnivaaNavn'] as String?,
          typekategoriNavn: item['typekategoriNavn'] as String?,
          langkode: langkode,
          definisjon: kode['definisjon'] as String?,
        ));

        if (item['hovedtypegrupper'] != null) {
          for (var group in item['hovedtypegrupper']) {
            processType(group, id);
          }
        }
        if (item['hovedtyper'] != null) {
          for (var mainType in item['hovedtyper']) {
            processType(mainType, id);
          }
        }
        if (item['grunntyper'] != null) {
          for (var basicType in item['grunntyper']) {
            processType(basicType, id);
          }
        }
        if (item['kartleggingsenheter'] != null) {
          for (var mappingUnit in item['kartleggingsenheter']) {
            processType(mappingUnit, id);
          }
        }
      }

      final rootTypes = data['typer'] as List;
      for (var type in rootTypes) {
        processType(type, null);
      }

      await db.batch((batch) {
        batch.insertAllOnConflictUpdate(db.ninTypes, types);
      });

      if (deepSync) {
        await scrapeMetadataForAll(db);
      }
    }
  }

  Future<void> _updateVariables(NinDatabase db) async {
    final response = await http.get(Uri.parse('$baseUrl/variabler/allekoder'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<NinVariable> variables = [];

      void processVariable(Map<String, dynamic> item, String? parentId) {
        final kode = item['kode'] as Map<String, dynamic>;
        final id = kode['id'] as String;

        variables.add(NinVariable(
          id: id,
          navn: item['navn'] as String,
          kategori: item['kategori'] as String? ?? 'Variabel',
          parentId: parentId,
          ecosystnivaaNavn: item['ecosystnivaaNavn'] as String?,
          variabelkategoriNavn: item['variabelkategoriNavn'] as String?,
        ));

        if (item['variabelnavn'] != null) {
          for (var name in item['variabelnavn']) {
            processVariable(name, id);
          }
        }
      }

      final rootVars = data['variabler'] as List;
      for (var v in rootVars) {
        processVariable(v, null);
      }

      await db.batch((batch) {
        batch.insertAllOnConflictUpdate(db.ninVariables, variables);
      });
    }
  }

  Future<void> scrapeMetadataForAll(NinDatabase db) async {
    final allTypes = await db.select(db.ninTypes).get();
    for (var type in allTypes) {
      if (type.langkode != null && (type.description == null || type.imageUrl == null)) {
        final extra = await fetchExtraMetadata(type.langkode!);
        if (extra != null) {
          await (db.update(db.ninTypes)..where((t) => t.id.equals(type.id))).write(
            NinTypesCompanion(
              description: Value(extra['description']),
              imageUrl: Value(extra['imageUrl']),
            ),
          );
          // Small delay to be polite to the server
          await Future.delayed(const Duration(milliseconds: 100));
        }
      }
    }
  }

  Future<Map<String, String?>?> fetchExtraMetadata(String langkode) async {
    try {
      final url = '$webBaseUrl/$langkode/beskrivelse';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final document = parse(response.body);
        
        // Extract description
        // On Artsdatabanken, descriptions are often in div.article-content or similar
        final content = document.querySelector('.main-content') ?? document.body;
        String? description;
        
        final paragraphs = content?.querySelectorAll('p') ?? [];
        if (paragraphs.isNotEmpty) {
          description = paragraphs.map((p) => p.text.trim()).where((t) => t.length > 20).take(2).join('\n\n');
        }

        // Extract image
        String? imageUrl;
        final imageElement = document.querySelector('img[src*="/sites/default/files/"]');
        if (imageElement != null) {
          imageUrl = imageElement.attributes['src'];
          if (imageUrl != null && !imageUrl.startsWith('http')) {
            imageUrl = 'https://artsdatabanken.no$imageUrl';
          }
        }

        return {
          'description': description,
          'imageUrl': imageUrl,
        };
      }
    } catch (e) {
      print('Error scraping $langkode: $e');
    }
    return null;
  }
}
