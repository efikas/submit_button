import 'package:flutter/material.dart';
import 'package:submit_button/src/buttons/normal_button.dart';
import 'package:submit_button/src/enum/buttonType.dart';
import 'package:submit_button/src/models/elasticButtonModel.dart';
import 'package:submit_button/src/models/normalButtonModel.dart';
import 'package:submit_button/src/models/rollOverButtonModel.dart';
import 'package:submit_button/src/models/slidingButtonModel.dart';
import 'package:submit_button/src/models/splashAwayButtonModel.dart';

// ignore: must_be_immutable
class SubmitButton extends StatelessWidget {
  /// the loading status of the button
  bool isLoading;
  /// the button type
  SubmitButtonType buttonType;
  /// the properties of the button
  dynamic buttonProperties;
  
  SubmitButton({
      Key key,
      @required this.isLoading,
      @required this.buttonType,
      @required this.buttonProperties,
    })
      : assert(isLoading != null),
        assert(buttonType != null),
        super(key: key);

  /// Local properties
  Size _size;
  NormalButton _normalButtonModel = NormalButton();
  ElasticButton _elasticButtonModel = ElasticButton();
  RollOverButton _rollOverButtonModel = RollOverButton();
  SlidingButton _slidingButtonModel = SlidingButton();
  SlashAwayButton _splashAwayButtonModel = SlashAwayButton();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _buttonPropertyNormalizer();

    if(buttonType == SubmitButtonType.normal) {
      return NormalButtonWidget(
        isLoading: isLoading, 
        button: _normalButtonModel.button,
        backgroundColor: _normalButtonModel.backgroundColor,
        spinnerColor: _normalButtonModel.spinnerColor,
      );
    }
      
    
    return Container();
  }


  void _buttonPropertyNormalizer(){
    if(buttonProperties.runtimeType == NormalButton){
      _normalButtonModel = buttonProperties;
    }

    if(buttonProperties.runtimeType == ElasticButton){
      _elasticButtonModel = buttonProperties;
    }

    if(buttonProperties.runtimeType == RollOverButton){
      _rollOverButtonModel = buttonProperties;
    }

    if(buttonProperties.runtimeType == SlidingButton){
      _slidingButtonModel = buttonProperties;
    }

    if(buttonProperties.runtimeType == SlashAwayButton){
      _splashAwayButtonModel = buttonProperties;
    }
  }

}
