import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../presentation/controllers/page_life_cycle_controller.dart';

abstract class ModularInjector<T extends StatefulWidget,
    C extends PageLifeCycleController> extends State<T> {
  late C controller;

  @override
  @mustCallSuper
  void initState() {
    controller = Modular.get<C>();
    log('${controller.runtimeType} initialized', name: 'Modular injector');
    controller.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log('${controller.runtimeType} ready', name: 'Modular injector');
      controller.onReady();
    });
    super.initState();
  }

  @override
  @mustCallSuper
  void dispose() {
    controller.onClose();
    Modular.dispose<C>();
    log('${controller.runtimeType} disposed', name: 'Modular injector');
    super.dispose();
  }
}
