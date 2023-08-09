import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/widgets/widget_loading.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';

import '../../../../../../../../design_system/images/images_app.dart';
import '../controllers/buy_controller.dart';
import 'components/card_buy_players.dart';

class BuyPage extends StatefulWidget {
  final String position;
  const BuyPage({super.key, required this.position});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {

  final controllerBuy = BuyController();
  
  @override
  void initState() {
    super.initState();
    controllerBuy.initBuy(widget.position);
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
            Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
            //Navigator.pop(context);
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
                controllerBuy.stateController != StateResponse.sucess 
                  ? 
                  Center(
                    child: WidgetLoading(
                      color: colors.green,
                      width: 6,
                      thickness: 1,
                    ),
                  ) 
                  : ListView.builder(
                    itemCount: controllerBuy.listBuy.length,
                    itemBuilder: (context, index) {
                      int numImage = controllerBuy.generateNumber();
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                        child: CardBuyPlayers(
                          color: colors,
                          image: controllerBuy.image[numImage],
                          playerEditionModel: controllerBuy.listBuy[index],
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