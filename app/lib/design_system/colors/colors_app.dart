import 'package:flutter/material.dart';

abstract class ColorsApp {
  //Seguir exemplo do branco
  Color get white;
  Color get whiteLigth;
  Color get white54;
  Color get red;
  Color get green;
  Color get greenLight;
  Color get orange;
  Color get black;
  Color get yellow;
  Color get yellowLight;
  Color get gray;
  Color get grayDark;
}

class ColorsAppDefault implements ColorsApp {
  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get whiteLigth => const Color(0xFFDEDEDE);
  @override
  Color get white54 => const Color(0x8AFFFFFF);
  @override
  Color get red => const Color(0xFFFF0000);
  @override
  Color get green => const Color(0xFF00BD08);
  @override
  Color get greenLight => const Color(0xFF00BC53);
  @override
  Color get orange => const Color(0xFFFF6400);
  @override
  Color get yellow => const Color(0xFFFFC000);//FFD800
  @override
  Color get yellowLight => const Color(0xFFFFD800);//Colors.white54
  @override
  Color get black => const Color(0xFF1A1A1A); 
  @override
  Color get gray => const Color(0xFFA0A0A0);
  @override
  Color get grayDark => const Color(0xff717F7F);
}