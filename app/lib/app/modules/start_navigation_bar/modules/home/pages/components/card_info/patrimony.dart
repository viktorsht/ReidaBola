import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class Patrimony extends StatelessWidget {
  final ColorsAppDefault colors;
  final double height;
  final double width;
  final String patrimonyValue ;


  const Patrimony({
    super.key, 
    required this.colors,
     required this.height, 
     required this.width, 
     required this.patrimonyValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.orange
      ),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "PATRIMÔNIO",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: colors.white
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'B\$', 
                style: TextStyle(
                  color: colors.white
                ),
              ),
              Text(
                patrimonyValue,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: colors.white
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}