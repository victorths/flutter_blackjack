import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/form_entity/player_form_entity.dart';

class HomeStore extends StateStore {
  final PlayerFormEntity boardPlayer = PlayerFormEntity();

  final PlayerFormEntity player = PlayerFormEntity();

  bool get didPlayerLose =>
      (revealCards &&
          (player.points < boardPlayer.points.$1 ||
              player.points < boardPlayer.points.$2) &&
          boardPlayer.points < 22) ||
      player.points > 21;

  final _deckId = Rxn<String>();
  String? get deckId => _deckId.value;
  set deckId(String? value) => _deckId.value = value;

  final _revealCards = Rx<bool>(false);
  bool get revealCards => _revealCards.value;
  set revealCards(bool value) => _revealCards.value = value;
}
