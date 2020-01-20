import 'package:flutter/material.dart';

class GradientDataPoint{
  final int value;
  final Color color;

  GradientDataPoint(this.value, this.color);
}

class SignedGradientDataPoint{
  final String value;
  final Color positiveColor;
  final Color negativeColor;

  SignedGradientDataPoint(this.value, this.positiveColor, this.negativeColor);
}