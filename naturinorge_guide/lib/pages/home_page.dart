import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/depriciated/t4_old_helper.dart';
import 'package:naturinorge_guide/generated/codegen_loader.g.dart';
import 'package:naturinorge_guide/pages/home_page_lib/home_page_button.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: NeumorphicAppBar(
          title: Text(LocaleKeys.name).tr(),
        ),
        body: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 24, mainAxisSpacing: 24),
          children: [
            HomePageButton(
                icon: Icons.map_outlined,
                text: LocaleKeys.structure.tr(),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StructurePage()))),
            HomePageButton(
              icon: Icons.help_center,
              text: LocaleKeys.T4_helper.tr(),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => T4HelpPageOld(
                            title: LocaleKeys.T4_helper.tr(),
                          ))),
            ),
            HomePageButton(
                icon: Icons.list,
                text: LocaleKeys.toggle_theme.tr(),
                onPressed: () => NeumorphicTheme.of(context).themeMode =
                    NeumorphicTheme.isUsingDark(context)
                        ? ThemeMode.light
                        : ThemeMode.dark),
          ],
        ),
      ),
    );
  }
}
