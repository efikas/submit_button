import 'package:flutter/material.dart';

class SlidingButton {
  /// the loading status of the button
  bool isLoading;
  /// the button widget
  Widget button;
  /// the color of the spinner, default is black
  Color spinnerColor;
  /// the button background color, default is black color
  Color backgroundColor;
  /// button horizontal padding, default is (size.width - 300) / 2
  double btnHorizontalPadding;

  SlidingButton({
      @required this.isLoading,
      @required this.button,
      this.spinnerColor,
      this.backgroundColor,
    })
    : assert(isLoading != null),
      assert(button != null);
}