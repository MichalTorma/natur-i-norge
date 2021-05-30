import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naturinorge_guide/generated/codegen_loader.g.dart';
import 'package:naturinorge_guide/pages/home_page_lib/home_page_button.dart';
import 'package:naturinorge_guide/pages/lec/lec_list_page.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group_page.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/other/loading.dart';
import 'package:naturinorge_guide/pages/nin_structure/other/loading_overlay.dart';
import 'package:naturinorge_guide/pages/species/species_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// const _mail_url = 'mailto:miso.torma.dev@gmail.com';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<NinStructureProvider>(context, listen: false).initialize();

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Natur i Norge guide'),
          bottom: LoadingWidget(),
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Om NiN-Guide')),
              ],
              onSelected: (idx) => showAboutDialog(
                  context: context,
                  applicationName: 'Natur i Norge guide',
                  applicationIcon: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      'assets/launch_icon/foreground.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  children: [
                    Text(
                        'Natur i Norge Guide er utviklet av Naturhistorisk Museum ved Universitetet i Oslo (NHM) i samarbeid med Artsdatabanken. Appen er et hjelpemiddel for naturkartleggere i arbeidet med å typifisere norsk natur etter typesystemet Natur i Norge.'),
                    Text(
                        'Appen ligger nå ute i en testversjon, og inneholder foreløpig kun art-/habitatrelasjoner for utvalgte arter i skogsmark. Datagrunnlaget appen bygger på er utarbeidet av NHM med bistand fra flere norske fagmiljø under utviklingen av Natur i Norge versjon 2. Dette datagrunnlaget er også tilgjengelig via'),
                    ElevatedButton(
                      onPressed: () async => await launch(
                          'https://artsdatabanken.no/egenskapsbanken'),
                      // onPressed: () async => await canLaunch(_mail_url)
                      //     ? await launch(_mail_url)
                      //     : throw 'Could not launch $_mail_url',
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('artsdatabanken.no'),
                          Icon(Icons.launch)
                        ],
                      ),
                    ),
                    Text(
                        'Natur i Norge Guide er tilgjengelig for nedlasting som Android- og iOS-app:'),
                    ElevatedButton(
                      onPressed: () async =>
                          await launch('https://l.ead.me/batwGC'),
                      // onPressed: () async => await canLaunch(_mail_url)
                      //     ? await launch(_mail_url)
                      //     : throw 'Could not launch $_mail_url',
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('App link'), Icon(Icons.launch)],
                      ),
                    ),

                    Text('Prof. Rune Halvorsen'),
                    Text('Michal Torma'),
                    Text('Artsdatabanken'),
                    // ElevatedButton(
                    //     onPressed: () async => await launch(_mail_url),
                    //     // onPressed: () async => await canLaunch(_mail_url)
                    //     //     ? await launch(_mail_url)
                    //     //     : throw 'Could not launch $_mail_url',
                    //     child: Text('Kontakt os'))
                  ]),
            )
          ],
        ),
        body: Stack(
          children: [
            GridView(
              padding: EdgeInsets.all(24),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1.618,
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24),
              children: [
                HomePageButton(
                    key: ValueKey('nin_structure_btn'),
                    image: Image.asset('assets/network_icon.png'),
                    text: LocaleKeys.structure.tr(),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MajorTypeGroupPage()))),
                HomePageButton(
                    key: ValueKey('lkm_btn'),
                    image: Image.asset('assets/gradient_icon.png'),
                    text: 'LKM',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LecListPage()))),
                HomePageButton(
                    key: ValueKey('species_btn'),
                    image: Image.asset('assets/species_icon.png'),
                    text: 'Arter',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SpeciesPage())))
              ],
            ),
            LoadingOverlay(),
          ],
        ),
      ),
    );
  }
}
