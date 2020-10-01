import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///check pakage of this button here
/// https://pub.dev/packages/nepninja

// ignore: must_be_immutable
class CircularLoadingButtonWidget extends StatefulWidget {
  bool isLoading;
  Curve animationCurve;

  CircularLoadingButtonWidget({
    Key key,
    this.isLoading = false, 
    this.animationCurve = Curves.fastOutSlowIn, 
  });
  @override
  State<StatefulWidget> createState() {
    return _StateCircularLoadingButtonWidget();
  }
}

class _StateCircularLoadingButtonWidget extends State<CircularLoadingButtonWidget> {
  bool _isLoading = false;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();

    _isLoading = widget.isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _isLoading = !_isLoading;
              _opacity = _opacity == 1.0 ? 0.0 : 1.0;
            });
          },
          child: AnimatedContainer(
            width: _isLoading ? 55 : 200,
            height: 55,
            curve: widget.animationCurve,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_isLoading ? 70.0 : 30.0),
              color: Colors.lightBlueAccent,
            ),
            duration: Duration(milliseconds: 700),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  opacity: _opacity,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isLoading = !_isLoading;
              _opacity = _opacity == 1.0 ? 0.0 : 1.0;
            });
          },
          child: AnimatedContainer(
            width: _isLoading ? 55 : 200,
            height: 55,
            curve: widget.animationCurve,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_isLoading ? 70.0 : 30.0),
            ),
            duration: Duration(milliseconds: 700),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 700),
              child: Padding(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.blueAccent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        _isLoading ? Colors.pinkAccent : Colors.blueAccent)),
                padding: EdgeInsets.all(1),
              ),
              opacity: _opacity == 0.0 ? 1.0 : 0.0,
            ),
          ),
        ),
      ],
    );
  }
}