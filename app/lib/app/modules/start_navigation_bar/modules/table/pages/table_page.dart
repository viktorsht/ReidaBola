import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/table/pages/components/general_league.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class TablePage extends StatelessWidget {
  
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: GeneralLeague(
                colors: colors,
              )
            ),
            const SizedBox(height: 16,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ranking",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
            /*
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index){
                return CardRanking(
                  color: colors, 
                  pathImage: ImagesApp.escudoTeam, 
                  titleText: "River Futebol Clud FC", 
                  subTitleText: "@mr.santos", 
                  subSubTitleText: "1535.85 pts", 
                  textEnd: "1º"
                );
              }
            )*/
          ],
        ),
      ),
    );
  }
}