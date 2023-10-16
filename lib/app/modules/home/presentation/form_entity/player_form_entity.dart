import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/domain/entities/card_entity.dart';

class PlayerFormEntity {
  final RxList<CardEntity> cards = RxList.empty();

  String get showPoints => points.$1 == points.$2
      ? points.$1.toString()
      : '${points.$1} ou ${points.$2}';

  (int, int) get points => cards.fold(
      (0, 0), (previousValue, card) => previousValue += card.getCardValue);
}
