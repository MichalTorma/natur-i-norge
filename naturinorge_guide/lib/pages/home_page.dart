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

// const _mail_url = 'mailto:miso.torma.dev@gmail.com';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
                PopupMenuItem<int>(value: 0, child: Text('Om os')),
              ],
              onSelected: (idx) => showAboutDialog(
                  context: context,
                  applicationName: 'Natur i Norge guide',
                  applicationIcon: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/icon.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  children: [
                    Text('Rune Halvorsen'),
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
                  maxCrossAxisExtent: 100,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24),
              children: [
                HomePageButton(
                    key: ValueKey('nin_structure_btn'),
                    icon: Icons.map_outlined,
                    text: LocaleKeys.structure.tr(),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MajorTypeGroupPage()))),
                HomePageButton(
                    key: ValueKey('lkm_btn'),
                    icon: Icons.list,
                    text: 'LKM',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LecListPage()))),
                HomePageButton(
                    key: ValueKey('species_btn'),
                    icon: Icons.place_outlined,
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
