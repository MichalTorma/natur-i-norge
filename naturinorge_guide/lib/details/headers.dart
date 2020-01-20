import 'package:flutter/material.dart';

class HorizontalHeader extends StatelessWidget {
  final String text;
  const HorizontalHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                text,
              ))),
      color: Theme.of(context).primaryColorLight,
    );
  }
}

class VerticalHeader extends StatelessWidget {
  final String text;
  const VerticalHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        text,
      )),
      color: Theme.of(context).primaryColorLight,
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String text;
  const HeaderCard({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColorDark,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white),
          ),
        )));
  }
}
