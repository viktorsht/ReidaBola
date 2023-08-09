import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class CardRanking extends StatelessWidget {

  /*
              CardRanking(
                color: colors,
                pathImage: ImagesApp.escudoTeam,
                titleText: "River Futebol Clud FC",
                subTitleText: "@mr.santos",
                subSubTitleText: "1535.85 pts",
                textEnd: "1º",
              ),*/

  final ColorsAppDefault color;
  final String pathImage;
  final String titleText;
  final String subTitleText;
  final String subSubTitleText;
  final String textEnd;


  const CardRanking({
    super.key, 
    required this.color, 
    required this.pathImage, 
    required this.titleText, 
    required this.subTitleText, 
    required this.subSubTitleText,
    required this.textEnd
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.whiteLigth,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 80,
      child: Row(
        children: [
          Image.asset(
            pathImage,
            height: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText, 
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                subTitleText,  
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal
                ),
              ),
              Text(
                subSubTitleText,  
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color.green,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                textEnd, 
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}