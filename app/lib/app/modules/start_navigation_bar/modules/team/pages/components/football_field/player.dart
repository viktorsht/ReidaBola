import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

import '../../../../../../../routes/routes_app.dart';


class Player extends StatelessWidget {
  
  final String image;
  final String? name;
  final String position;
  final double top;
  final double right;
  final double left;

  const Player({super.key, 
    required this.image,
    required this.name,
    required this.top,
    required this.right,
    required this.left,
    required this.position,
  }) : assert(top > 0.0);

  @override
  Widget build(BuildContext context) {
    final double heightFinal = MediaQuery.of(context).size.height;
    double height = 0.18181818 * (0.6773399 * heightFinal);
    final colors = ColorsAppDefault();

    return Positioned(
      top: top,
      right: right,
      left: left,
      child: Column( // Trocamos o ListView por Column
        children: [
          IconButton(
            onPressed: () {
              //print(position);
              Modular.to.pushNamed(RoutesModulesApp.routerBuyModule, arguments: position);
            },
            icon: Image.asset(
              image,
              height: position == 'Goleiro' ? height - 60.0 : height - 60,
            ),
          ),
          name == null 
          ? Container()
          : Container(
            decoration: BoxDecoration(
              color: colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 20.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(
                name!,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
