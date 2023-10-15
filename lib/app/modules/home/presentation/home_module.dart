import 'package:flutter_blackjack/app/app_module.dart';
import 'package:flutter_blackjack/app/modules/home/data/infra/blackjack_datasouce.dart';
import 'package:flutter_blackjack/app/modules/home/data/repositories/blackjack_repository.dart';

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
    i.addSingleton<HomeController>(
      () => HomeController(
        store: HomeStore(),
        repository: BlackjackRepositoryImpl(
          datasource: BlackjackDatasource(
            remoteDatasource: i.get(),
          ),
        ),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      Paths.root,
      child: (c) => const HomePage(),
    );
  }
}
