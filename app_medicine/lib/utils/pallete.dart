import 'package:flutter/material.dart'; 
class Palette { 
  static MaterialColor pinkToWhite = const MaterialColor( 
    0xffef6f86, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{
      50: Color(0xfff17d92), //10%
      100: Color(0xfff28c9e), //20%
      200: Color(0xfff49aaa), //30%
      300: Color(0xfff5a9b6), //40%
      400: Color(0xfff7b7c3), //50%
      500: Color(0xfff9c5cf), //60%
      600: Color(0xfffad4db), //70%
      700: Color(0xfffce2e7), //80%
      800: Color(0xfffdf1f3), //90%
      900: Color(0xffffffff), //100%
    }, 
  ); 

  static MaterialColor blackToWhite = const MaterialColor( 
    0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{
      50: Color(0xff1a1a1a), //10%
      100: Color(0xff333333), //20%
      200: Color(0xff4d4d4d), //30%
      300: Color(0xff666666), //40%
      400: Color(0xff808080), //50%
      500: Color(0xff999999), //60%
      600: Color(0xffb3b3b3), //70%
      700: Color(0xffcccccc), //80%
      800: Color(0xffe6e6e6), //90%
      900: Color(0xffffffff), //100%
    }, 
  ); 

}