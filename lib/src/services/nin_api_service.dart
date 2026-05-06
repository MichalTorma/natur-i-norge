import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/nin_database.dart';
import 'package:drift/drift.dart';

class NinApiService {
  static const String baseUrl = 'https://nin-kode-api.artsdatabanken.no/v3.0';

  Future<void> updateAllData(NinDatabase db) async {
    await _updateTypes(db);
    await _updateVariables(db);
  }

  Future<void> _updateTypes(NinDatabase db) async {
    final response = await http.get(Uri.parse('$baseUrl/typer/allekoder'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<NinType> types = [];
      
      void processType(Map<String, dynamic> item, String? parentId) {
        final kode = item['kode'] as Map<String, dynamic>;
        final id = kode['id'] as String;
        
        types.add(NinType(
          id: id,
          navn: item['navn'] as String,
          kategori: item['kategori'] as String,
          parentId: parentId,
          ecosystnivaaNavn: item['ecosystnivaaNavn'] as String?,
          typekategoriNavn: item['typekategoriNavn'] as String?,
          langkode: kode['langkode'] as String?,
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
        
        // Conversions
        if (item['konverteringer'] != null) {
          // TODO: Store conversions
        }
      }

      final rootTypes = data['typer'] as List;
      for (var type in rootTypes) {
        processType(type, null);
      }

      await db.batch((batch) {
        batch.insertAllOnConflictUpdate(db.ninTypes, types);
      });
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
}
