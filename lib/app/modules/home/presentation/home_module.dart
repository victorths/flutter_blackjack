import '../../../commons/commons.dart';
import 'home_controller.dart';
import 'home_store.dart';
import 'home_widget.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(
      () => HomeController(
        store: HomeStore(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      Paths.root,
      child: (c) => const HomeWidget(),
    );
  }
}
