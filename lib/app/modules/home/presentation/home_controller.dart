import '../../../commons/commons.dart';
import 'home_store.dart';

class HomeController extends PageLifeCycleController<HomeStore> {
  HomeController({
    required this.store,
  });

  @override
  final HomeStore store;

  @override
  void onReady() {
    super.onReady();
  }
}
