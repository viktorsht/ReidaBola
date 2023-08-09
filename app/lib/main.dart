import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rei_da_bola/app/app_module.dart';
import 'package:rei_da_bola/app/app_widget.dart';

void main() {
    
  initializeDateFormatting().then(
    (_) => runApp(
      ModularApp(
        module: AppModule(), 
        child: const AppWidget()
      ),
    )
  );
}  