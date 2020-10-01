import 'package:flutter/material.dart';

class NormalButton {
  /// the button widget
  Widget button;
  /// the color of the spinner, default is black
  Color spinnerColor;
  /// the button background color, default is black color
  Color backgroundColor;
  /// button horizontal padding, default is (size.width - 300) / 2
  double btnHorizontalPadding;

  NormalButton({
      @required this.button,
      this.spinnerColor,
      this.backgroundColor,
    })
    : assert(button != null);
}