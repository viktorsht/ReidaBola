import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/widgets/widget_loading.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';

import '../../../../../../../../design_system/images/images_app.dart';
import '../controllers/lineup_controller.dart';
import 'components/card_buy_players.dart';

class LineUpPage extends StatefulWidget {
  final String position;
  final int round;
  final int edition;

  const LineUpPage({
    super.key, 
    required this.position, 
    required this.round,
    required this.edition
  });

  @override
  State<LineUpPage> createState() => _LineUpPageState();
}

class _LineUpPageState extends State<LineUpPage> {

  final lineUpController = LineUpController();
  
  @override
  void initState() {
    super.initState();
      lineUpController.initBuy(widget.position, widget.round, widget.edition);
  }

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.green,
        centerTitle: true,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Image.asset(
            ImagesApp.brasaoTeam,
            height: 50,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            //Navigator.pushNamed(context, RoutesModulesApp.routerStartNavigationBarModule);
            Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
          },
        ),
      ),
      body: 
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Buscando por ${widget.position}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => 
                lineUpController.stateController != StateResponse.sucess 
                  ? 
                  Center(
                    child: WidgetLoading(
                      color: colors.green,
                      width: 6,
                      thickness: 1,
                    ),
                  ) 
                  : ListView.builder(
                    itemCount: lineUpController.listLineUp.length,
                    itemBuilder: (context, index) {
                      int numImage = lineUpController.generateNumber();
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                        child: CardBuyPlayers(
                          color: colors,
                          image: lineUpController.image[numImage],
                          player: lineUpController.listLineUp[index],
                        ),
                      );
                    },
                  ),
              ),
            ),
          ],
        ),
    );
  }
}