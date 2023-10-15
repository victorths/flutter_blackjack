import 'package:flutter_blackjack/app/modules/home/domain/repositories/product_repository.dart';

import '../../../commons/commons.dart';
import 'home_store.dart';

class HomeController extends PageLifeCycleController<HomeStore> {
  HomeController({
    required this.store,
    required this.repository,
  });

  BlackjackRepository repository;

  @override
  final HomeStore store;

  Future<void> startGame() async {
    try {
      await _createNewDeck();
      store.player.cards.clear();
      store.baordPlayer.cards.clear();
      await Future.wait([
        _drawBoardCards(2),
        _drawPlayerCards(2),
      ]);
    } on Exception catch (e) {
      store.error = e;
    }
  }

  _createNewDeck() async {
    store.deckId = await repository.newDeck();
  }

  Future<void> _drawPlayerCards(int count) async {
    if (store.deckId != null) {
      store.player.cards
          .addAll(await repository.drawCards(store.deckId!, count));
    } else {
      throw Exception('The deck must be initialized');
    }
  }

  Future<void> _drawBoardCards(int count) async {
    if (store.deckId != null) {
      store.baordPlayer.cards
          .addAll(await repository.drawCards(store.deckId!, 2));
    } else {
      throw Exception('The deck must be initialized');
    }
  }
}
