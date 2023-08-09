import 'package:flutter/material.dart';

import '../../../../../../../design_system/colors/colors_app.dart';
import '../../../../../../../design_system/images/images_app.dart';

class GeneralLeague extends StatelessWidget {
  final ColorsAppDefault colors;
  const GeneralLeague({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImagesApp.trofeu),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Liga Geral",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4,),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 200,
              ),
              child: const Text(
                "Tabela de todos os participantes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}