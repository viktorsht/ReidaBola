import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class Punctuations extends StatelessWidget {
  final ColorsAppDefault colors;
  final double height;
  final double width;
  final String punctuation ;


  const Punctuations({
    super.key, 
    required this.colors,
     required this.height, 
     required this.width, 
     required this.punctuation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.greenLight
      ),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ÚLTIMA RODADA",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: colors.white
            ),
          ),
          Text(
            punctuation,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: colors.white
            ),
          )
        ],
      ),
    );
  }
}