import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class WidgetLoading extends StatelessWidget {
  
  final Color? color;
  final double? width;
  final double? thickness;

  const WidgetLoading({
    super.key, 
    this.color, 
    required this.width, 
    required this.thickness
  });
  
  @override
  Widget build(BuildContext context) {
    final colorsApp = ColorsAppDefault();
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Transform.scale(
        scale: thickness == null ? 1 : thickness!,
        child: CircularProgressIndicator(
          color: color == null ? colorsApp.white : colorsApp.green,
          strokeWidth: width == null ? 6 : width!,
        ),
      ),
    );
  }
}