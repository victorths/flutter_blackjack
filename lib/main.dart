import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blackjack/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppPage(),
    ),
  );
}
