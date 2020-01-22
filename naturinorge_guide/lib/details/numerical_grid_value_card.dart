import 'package:flutter/material.dart';
import 'package:naturinorge_guide/details/gradient_data_point.dart';

class NumericalGridValue extends StatelessWidget {
  final GradientDataPoint data;
  const NumericalGridValue({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Card(
            color: Colors.grey.shade100,
          )
        : Card(
            color: data.color.withAlpha(42 * data.value.abs()),
            child: Center(
              child: Text(data.value.toString(), style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),),
            ),
          );
  }
}
