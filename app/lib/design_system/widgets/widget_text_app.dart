import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class WidgetTextApp extends StatelessWidget {
  
  final String widgetText;
  final Color? color;
  final double? size;
  final double? maxWidth;

  const WidgetTextApp({
    super.key, 
    required this.widgetText, 
    this.size,
    this.color, 
    this.maxWidth,
  });


  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Align(
      alignment: Alignment.center,
      child: Text(
        widgetText,
        style: TextStyle(
          fontSize: size ?? 32,
          color: color ?? colors.white,
        ),
      ),
    );
  }
}