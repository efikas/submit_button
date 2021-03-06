import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NormalButtonWidget extends StatelessWidget {
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
  NormalButtonWidget(
      {Key key,
      @required this.isLoading,
      @required this.button,
      this.spinnerColor,
      this.backgroundColor})
      : assert(isLoading != null),
        assert(button != null),
        super(key: key);
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Animator(
      duration: Duration(milliseconds: 300),
      cycles: 1,
      builder: (context, animatorState, child) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: _buttonAnimate(animatorState.value),
          vertical: 24.0,
        ),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.black87,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Center(child: _buttonLabel(animatorState.value)),
        ),
      ),
    );
  }

  ///calculate the login button padding for animation
  double _buttonAnimate(double tween) {
    btnHorizontalPadding = btnHorizontalPadding ?? (size.width - 300) / 2;
    if (isLoading == true) {
      return btnHorizontalPadding + (80 * tween);
    } else {
      return btnHorizontalPadding;
    }
  }

  Widget _buttonLabel(double tween) {
    if (isLoading) {
      return Container(
        width: 20,
        height: 20.0,
        child: CircularProgressIndicator(
          backgroundColor: spinnerColor ?? Colors.black,
          strokeWidth: 2,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return button;
    }
  }
}