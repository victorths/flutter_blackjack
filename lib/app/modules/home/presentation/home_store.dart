import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/form_entity/player_form_entity.dart';

class HomeStore extends StateStore {
  final PlayerFormEntity baordPlayer = PlayerFormEntity();

  final PlayerFormEntity player = PlayerFormEntity();

  final _deckId = Rxn<String>();
  String? get deckId => _deckId.value;
  set deckId(String? value) => _deckId.value = value;
}
