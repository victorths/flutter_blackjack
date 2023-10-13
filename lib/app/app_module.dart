import 'package:flutter_blackjack/app/modules/home/presentation/home_module.dart';

import 'commons/commons.dart';
import 'commons/data/infra/dio_datasource.dart';

class AppModule extends Module {
  @override
  void exportedBinds(i) {
    i.add<RemoteDatasource>(DioDatasource.new);
  }

  @override
  void routes(r) {
    r.module(
      Paths.home,
      module: HomeModule(),
    );
  }
}
