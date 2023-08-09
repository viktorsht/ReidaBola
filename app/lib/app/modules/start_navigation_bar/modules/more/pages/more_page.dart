import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/controller/more_controller.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import '../../../../../../design_system/widgets/widget_loading.dart';
import 'components/championship_round_page.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  
  final controllerMore = MoreController();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    //controllerMore.initMore();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Scaffold(
      body: Column(
        children: [
          Observer(
            builder: (_) => 
            Container(
              color: colors.white,
              height: 300,
              child:  FutureBuilder(
                future: controllerMore.initMore(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: WidgetLoading(
                        color: colors.green,
                        width: 6,
                        thickness: 1,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Erro ao carregar os dados'), // Mensagem de erro
                    );
                  }
                  else{
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: controllerMore.numRodadas + 1,
                      itemBuilder: (context, index){
                        return ChampionshipRoundPage(
                          round: index + 1,
                          listRound: controllerMore.listSoccerMatch,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          const Text("data", style: TextStyle(fontSize: 50),)
        ],
      ),
    );
  }
}
                  