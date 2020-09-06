import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_description.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/details_view.dart';
import 'package:naturinorge_guide/details/map_provider.dart';
import 'package:naturinorge_guide/filter_provider.dart';
import 'package:naturinorge_guide/pages/home_page.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:naturinorge_guide/tools/my_theme.dart';
import 'package:preferences/preferences.dart';
import 'package:provider/provider.dart';

import 'depriciated/t4_old_helper.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');
  PrefService.setDefaultValues({
    //   PREFS_DARK: false,
    //   PREFS_CHILD: false,
  });
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en', 'US'), Locale('nb', 'NO')],
    path: 'local', //'resources/langs',
    fallbackLocale: Locale('nb', 'NO'),
    startLocale: Locale('nb', 'NO'),
    // saveLocale: false,
    // useOnlyLangCode: true,
    // preloaderColor: Colors.black,
    // preloaderWidget: CustomPreloaderWidget(),

    // optional assetLoader default used is RootBundleAssetLoader which uses flutter's assetloader
    // install easy_localization_loader for enable custom loaders
    // assetLoader: RootBundleAssetLoader()
    // assetLoader: HttpAssetLoader()
    // assetLoader: FileAssetLoader()
    // assetLoader: CsvAssetLoader()
    // assetLoader: YamlAssetLoader() //multiple files
    // assetLoader: YamlSingleAssetLoader() //single file
    // assetLoader: XmlAssetLoader() //multiple files
    // assetLoader: XmlSingleAssetLoader() //single file
    // assetLoader: CodegenLoader()
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FilterProvider>(
            create: (_) => FilterProvider(MyDatabase().t4Dao),
          ),
          ChangeNotifierProvider<MapProvider>(
            create: (_) => MapProvider(),
          ),
          ChangeNotifierProvider<NinStructureProvider>(
            create: (_) => NinStructureProvider(),
          )
        ],
        child: NeumorphicApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: LocaleKeys.name.tr(),
            themeMode: ThemeMode.light,
            theme: NeumorphicThemeData(
              baseColor: Color(0xFFFFFFFF),
              lightSource: LightSource.topLeft,
              depth: 10,
            ),
            darkTheme: NeumorphicThemeData(
              baseColor: Color(0xFF3E3E3E),
              lightSource: LightSource.topLeft,
              depth: 6,
            ),
            home: HomePage()));
  }
}
