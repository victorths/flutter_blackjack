import 'package:collection/collection.dart';
import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/form_entity/player_form_entity.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/widgets/card.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/widgets/text_box.dart';

class PlayerHandWidget extends StatelessWidget {
  const PlayerHandWidget({
    super.key,
    required this.player,
    this.shouldOmitCards = false,
  });

  final PlayerFormEntity player;
  final bool shouldOmitCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextBoxWidget(
          shouldOmitCards
              ? player.cards.first.getCardValue.$2.toString()
              : player.showPoints,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: player.cards
              .mapIndexed(
                (index, card) => CardWidget(
                  card: card,
                  revealed: shouldOmitCards ? index == 0 : true,
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
