import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class FeaturedPlayer extends StatelessWidget {
  final ColorsAppDefault colors;
  final double height;
  final double width;
  final String playerPoints;
  final String namePlayer;


  const FeaturedPlayer({
    super.key, 
    required this.colors,
     required this.height, 
     required this.width, 
     required this.playerPoints,
     required this.namePlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.yellow
      ),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "DESTAQUE",
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
                playerPoints,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: colors.white
                ),
              ),
              Text(
                'pts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: colors.white
                ),
              ),
            ],
          ),
          Text(
            namePlayer,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: colors.white
            ),
          ),
        ],
      ),
    );
  }
}