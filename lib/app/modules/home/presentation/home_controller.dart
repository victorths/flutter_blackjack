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

  @override
  void onReady() {
    store.completed();
    super.onReady();
  }

  Future<void> startGame() async {
    try {
      store.revealCards = false;
      store.loading();
      await _createNewDeck();
      store.player.cards.clear();
      store.boardPlayer.cards.clear();
      await Future.wait([
        _drawBoardCards(2),
        _drawPlayerCards(2),
      ]);
      store.completed();
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
      store.boardPlayer.cards
          .addAll(await repository.drawCards(store.deckId!, count));
    } else {
      throw Exception('The deck must be initialized');
    }
  }

  void drawCard() async {
    try {
      store.loading();
      await Future.wait([
        _drawPlayerCards(1),
        _drawBoardCards(1),
      ]);
      store.completed();
      _checkOver21();
    } on Exception catch (e) {
      store.error = e;
    }
  }

  void _checkOver21() {
    if (store.player.points > 21) {
      stop();
    }
  }

  void stop() {
    store.revealCards = true;
  }
}
