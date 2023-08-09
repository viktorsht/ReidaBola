import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../../../../../../../../shared/token/token_manager.dart';

class ProfileHome extends StatelessWidget {
  final TokenManager tokenManager;

  const ProfileHome({
    super.key, 
    required this.tokenManager
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Image.asset(
            ImagesApp.escudoTeam
            )
          ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "River Futebol Club FC",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "@mr.santos",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                //color: colors.gray
              ),
            ),
          ],
        )
      ],
    );
  }
}