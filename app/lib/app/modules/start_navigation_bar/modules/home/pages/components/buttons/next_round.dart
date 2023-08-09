import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../../../../../../../design_system/icons/icons_app.dart';

class NextRoundButton extends StatelessWidget {
  final ColorsAppDefault colors;
  final double heightNextRoundButton;
  final double widthNextRoundButton;
  final VoidCallback onPressed;
  final String numberRound;
  final String timeRound;

  const NextRoundButton({
    super.key,
    required this.colors, 
    required this.heightNextRoundButton, 
    required this.widthNextRoundButton, 
    required this.onPressed, 
    required this.numberRound, 
    required this.timeRound,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.yellowLight
      ),
      height: heightNextRoundButton,
      width: widthNextRoundButton,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                numberRound,
                style: TextStyle(
                  color: colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(IconsApp.clock),
                  //const SizedBox(width: 10,),
                  Text(
                    "$timeRound restantes",
                    style: TextStyle(
                      color: colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(ImagesApp.apitoWhite),
        ],
      )
    );
  }
}