import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton(
      {Key key,
      @required this.icon,
      @required this.text,
      @required this.onPressed})
      : super(key: key);
  final IconData icon;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NeumorphicButton(
        style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        ),
        child: Expanded(
          child: Center(
            child: Column(
              children: [
                Icon(icon),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
