import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/shared/user/controller/user_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/home_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/table/pages/table_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/team_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/submodules/buy/stories/buy_store.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/components/navigator_component.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/stories/navigation_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../shared/round_roday/controller/round_today_controller.dart';
import '../modules/drawer/pages/drawer_page.dart';
import '../modules/more/pages/more_page.dart';


class StartNavigationBarPage extends StatefulWidget {
  const StartNavigationBarPage({super.key});

  @override
  State<StartNavigationBarPage> createState() => _StartNavigationBarPageState();
}

class _StartNavigationBarPageState extends State<StartNavigationBarPage> {

  late NavigationStore navigationStore;
  
  final pageViewController = PageController();

  final userController = UserController();
  final roundTodayController = RoundTodayController();
  final storeBuy = BuyStore();
  
  @override
  void initState() {
    super.initState();
    userController.initUserInfomations();
    roundTodayController.initRoundToday();
    //print(championshipRoundController.round.name);
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
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
      ),
      drawer: Observer(
        builder: (_) => DrawerPage(
          colors: colors,
          user: userController.team.user!, // pode dar problema por ser não nulo - trocar por startController.user
        ),
      ),
      body: Center(
        child: PageView(
          controller: pageViewController,
          children: [
           
            Observer(
              builder: (_) => HomePage(
                teamGameModel: userController.team,
                soccerMatchModel: roundTodayController.round,
                pageController: pageViewController,
              ),
            ),
            const TablePage(),
            Observer(
              builder: (context) {
                return const TeamPage();
              }
            ),
            Container(color: Colors.yellow,),
            const MorePage(),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageViewController,
        builder: (context, snapshot) {
          return NavigatorComponent(
            color: colors,
            pageController: pageViewController,
          );
        }
      )

    );
  }
}