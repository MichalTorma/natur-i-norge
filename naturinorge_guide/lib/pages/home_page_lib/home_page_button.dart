import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton(
      {Key? key,
      required this.image,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final Image image;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: image),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.7,
                    // style: Theme.of(context).textTheme.headline3,
                  ),
                )
              ],
            ),
          ),
        ),
        onPressed: onPressed as void Function()?,
      ),
    );
  }
}
