import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/domain/entities/card_entity.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.card,
    required this.revealed,
  });

  final CardEntity card;
  final bool revealed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: (size.width / 10).clamp(50, 180),
      child: revealed
          ? CustomCachedNetworkImage(
              image: card.image,
            )
          : Image.asset(
              Assets.back,
            ),
    );
  }
}
