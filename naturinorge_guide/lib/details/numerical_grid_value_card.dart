import 'package:flutter/material.dart';

class NumericalGridValue extends StatelessWidget {
  final int value;
  final Color color;
  const NumericalGridValue({Key key, this.value, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow.withAlpha(42 * value),
      child: Center(
        child: Text(value.toString()),
      ),
    );
  }
}