import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/depriciated/t4_old_helper.dart';
import 'package:naturinorge_guide/pages/home_page_lib/home_page_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: NeumorphicAppBar(
          title: Text('Natur i Norge'),
        ),
        body: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 24),
          children: [
            HomePageButton(
              icon: Icons.help_center,
              text: 'T4 helper',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => T4HelpPageOld(
                            title: 'T4 helper',
                          ))),
            ),
            NeumorphicButton(
                margin: EdgeInsets.only(top: 12),
                onPressed: () {
                  NeumorphicTheme.of(context).themeMode =
                      NeumorphicTheme.isUsingDark(context)
                          ? ThemeMode.light
                          : ThemeMode.dark;
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Toggle Theme",
                  style: TextStyle(color: _textColor(context)),
                )),
          ],
        ),
      ),
    );
  }
}
