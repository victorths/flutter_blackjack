import 'package:flutter_blackjack/app/app_module.dart';
import 'package:flutter_blackjack/app/modules/home/data/infra/blackjack_datasouce.dart';
import 'package:flutter_blackjack/app/modules/home/data/repositories/blackjack_repository.dart';
import 'package:flutter_blackjack/app/modules/home/domain/repositories/product_repository.dart';

import '../../../commons/commons.dart';
import 'home_controller.dart';
import 'home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton<HomeStore>(HomeStore.new);
    i.addSingleton<BlackjackRepository>(BlackjackRepositoryImpl.new);
    i.addSingleton<BlackjackDatasource>(BlackjackDatasource.new);
    i.addSingleton<HomeController>(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(
      Paths.root,
      child: (c) => const HomePage(),
    );
  }
}
