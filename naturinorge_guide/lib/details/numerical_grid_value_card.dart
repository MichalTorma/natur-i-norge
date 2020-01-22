import 'package:flutter/material.dart';
import 'package:naturinorge_guide/details/gradient_data_point.dart';

class NumericalGridValue extends StatelessWidget {
  final GradientDataPoint data;
  const NumericalGridValue({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if (data == null)
      return Card(
            color: Colors.grey.shade100,
          );
    else if (data.value == 0)
      return Card(
            color: Colors.grey.shade200,
            child: Center(
              child: Text(data.value.toString(), style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),),
            ),
          );
    return Card(
            color: data.color.withAlpha(42 * data.value.abs()),
            child: Center(
              child: Text(data.value.toString(), style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),),
            ),
          );
  }
}
