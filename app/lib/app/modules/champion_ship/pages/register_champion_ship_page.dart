import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';

import '../../../../design_system/colors/colors_app.dart';
import '../../../../design_system/images/images_app.dart';
import '../../../../design_system/widgets/widget_text_app.dart';
import '../../../routes/routes_app.dart';
import '../controllers/champion_ship_edition_controller.dart';
import '../models/champion_ship_models.dart';

class RegisterChampionShipPage extends StatelessWidget {
  final int teamGameId;

  const RegisterChampionShipPage({
    super.key, 
    required this.teamGameId
  });

  @override
  Widget build(BuildContext context) {

    final championshipController = ChampionShipEditionController();
    final colors = ColorsAppDefault();

    String selectOption='';
    int championshipEditionId = 0;

    return Scaffold(
      backgroundColor: colors.green,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImagesApp.logo),
              const SizedBox(height: 16,),
              Text(
                'Selecione um campeonato',
                style: TextStyle(
                  fontSize: 28,
                  color: colors.white
                ),
              ),
              const SizedBox(height: 32,),
              FutureBuilder(
                future: championshipController.initListChampionShit(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: colors.white,
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Erro ao carregar os dados");
                  } else {
                    final items = championshipController.championShip;
                    selectOption = items[0].championship!.name!; // Use o primeiro item se selectOption for nulo.
                    championshipEditionId = items[0].championshipId!; // Armazene o ID do primeiro item se não houver nenhum valor selecionado ainda.
              
                    return Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectOption,
                        hint: const Text("Selecione um campeonato"),
                        dropdownColor: colors.white,
                        onChanged: (value) {
                          final selectedChampionship = items.firstWhere(
                            (championship) => championship.championship?.name == value);
              
                          // Atualize a variável selectOption para o nome selecionado e championshipEditionId para o ID selecionado.
                          selectOption = selectedChampionship.championship!.name!;
                          championshipEditionId = selectedChampionship.championshipId!;
                        },
                        items: items.map((ChampionShipEditionModel value) {
                          return DropdownMenuItem<String>(
                            value: value.championship?.name,
                            child: Text(value.championship!.name!),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 32,),
              Observer(
                builder:(_) => championshipController.stateController == StateResponse.loading 
                ? CircularProgressIndicator(color: colors.white,)
                : TextButton(
                  onPressed: () async {
                    await championshipController.postTeamGameEdition(teamGameId, championshipEditionId);
                    if(championshipController.stateController == StateResponse.sucess){
                      Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
                    }
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const WidgetTextApp(widgetText: "Finalizar",),
                      const SizedBox(width: 10,),
                      Image.asset(ImagesApp.entrarWhite),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}