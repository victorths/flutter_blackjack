import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/domain/entities/card_entity.dart';

class PlayerFormEntity {
  final RxList<CardEntity> cards = RxList.empty();

  (int, int) get points => cards.fold(
      (0, 0), (previousValue, card) => previousValue += _getCardValue(card));

  (int, int) _getCardValue(CardEntity card) {
    return switch (card.value) {
      'ACE' => (1, 11),
      'JACK' || 'QUEEN' || 'KING' => (10, 10),
      _ => card.valueToRecord,
    };
  }
}
