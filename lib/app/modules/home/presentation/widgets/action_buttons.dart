import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.onMoreCards,
    required this.onStop,
  });

  final VoidCallback onMoreCards;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DrawCardButton(onMoreCards: onMoreCards),
        StopButton(onStop: onStop),
      ],
    );
  }
}

class StopButton extends StatelessWidget {
  const StopButton({
    super.key,
    required this.onStop,
  });

  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onStop,
      child: SizedBox(
        width: (size.width / 20).clamp(10, 50) + 10,
        child: Stack(
          children: [
            Icon(
              RpgAwesome.diamonds_card,
              color: Colors.white,
              size: (size.width / 20).clamp(10, 50),
            ),
            Positioned(
              right: 0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Icon(
                  FontAwesome5.hand_paper,
                  size: (size.width / 50).clamp(5, 25),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawCardButton extends StatelessWidget {
  const DrawCardButton({
    super.key,
    required this.onMoreCards,
  });

  final VoidCallback onMoreCards;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onMoreCards,
      child: SizedBox(
        width: (size.width / 20).clamp(10, 50) + 10,
        child: Stack(
          children: [
            Icon(
              RpgAwesome.spades_card,
              color: Colors.white,
              size: (size.width / 20).clamp(10, 50),
            ),
            Positioned(
              right: 0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Icon(
                  FontAwesome5.plus,
                  size: (size.width / 50).clamp(5, 25),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
