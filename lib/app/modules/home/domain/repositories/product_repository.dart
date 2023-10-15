import 'package:flutter_blackjack/app/modules/home/domain/entities/card_entity.dart';

abstract class BlackjackRepository {
  Future<List<CardEntity>> drawCards(String deckId, int count);

  Future<bool> shuffleDeck(String deckId);

  Future<String> newDeck();
}
