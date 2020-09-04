import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_description.dart';
import 'package:naturinorge_guide/details/details_view.dart';
import 'package:naturinorge_guide/details/map_provider.dart';
import 'package:naturinorge_guide/filter_provider.dart';
import 'package:naturinorge_guide/pages/home_page.dart';
import 'package:naturinorge_guide/tools/my_theme.dart';
import 'package:preferences/preferences.dart';
import 'package:provider/provider.dart';

import 'depriciated/t4_old_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');
  PrefService.setDefaultValues({
    //   PREFS_DARK: false,
    //   PREFS_CHILD: false,
  });
  runApp(MyApp());
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
          )
        ],
        child: NeumorphicApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
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
