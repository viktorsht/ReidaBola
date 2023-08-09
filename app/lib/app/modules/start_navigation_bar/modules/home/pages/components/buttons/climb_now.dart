import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/icons/icons_app.dart';

class ClimbNowButton extends StatelessWidget {
  
  final VoidCallback onPressed;
  final double heightClimbNowButton;
  final double widthClimbNowButton;
  final String text;
  final ColorsAppDefault colors;

  const ClimbNowButton({
    super.key, 
    required this.onPressed, 
    required this.heightClimbNowButton, 
    required this.widthClimbNowButton, 
    required this.text, 
    required this.colors
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // coloca a função aquiiiiiii
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colors.black
        ),
        height: heightClimbNowButton,
        width: widthClimbNowButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ESCALAR AGORA",
              style: TextStyle(
                color: colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Image.asset(IconsApp.teamWhite),
          ],
        )
      ),
    );
  }
}