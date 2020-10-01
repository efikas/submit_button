import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NormalButtonWidgetV2 extends StatelessWidget {
  /// the loading status of the button
  bool isLoading;
  /// the button widget
  Widget button;
  /// the color of the spinner, default is black
  Color spinnerColor;
  /// the border color, default is black color
  Color borderColor;
  /// button horizontal padding, default is (size.width - 300) / 2
  double btnHorizontalPadding;

  NormalButtonWidgetV2(
      {Key key,
      @required this.isLoading,
      @required this.button,
      this.spinnerColor,
      this.btnHorizontalPadding,
      this.borderColor})
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
            horizontal: _buttonAnimate(animatorState.value), vertical: 0),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.black87),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
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
      return btnHorizontalPadding + (20 * tween);
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
          valueColor:
              new AlwaysStoppedAnimation<Color>(borderColor ?? Colors.white),
        ),
      );
    } else {
      return button;
    }
  }
}
