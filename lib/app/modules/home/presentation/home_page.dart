import '../../../commons/commons.dart';
import 'home_controller.dart';
import 'widgets/action_buttons.dart';
import 'widgets/player_hand.dart';
import 'widgets/text_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularInjector<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: AspectRatio(
            aspectRatio: 1920 / 1080,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Assets.board,
                ),
                if (controller.store.deckId != null &&
                    !controller.store.isLoading &&
                    !controller.store.revealCards)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ActionButtons(
                        onMoreCards: controller.drawCard,
                        onStop: controller.stop,
                      ),
                    ),
                  ),
                if (controller.store.deckId == null &&
                    !controller.store.isLoading)
                  CustomFilledButtom(
                    expanded: false,
                    onPressed: controller.startGame,
                    text: 'Iniciar Jogo',
                  )
                else
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.store.boardPlayer.cards.isNotEmpty)
                        PlayerHandWidget(
                          player: controller.store.boardPlayer,
                          shouldOmitCards: !controller.store.revealCards,
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (controller.store.player.cards.isNotEmpty)
                        PlayerHandWidget(
                          player: controller.store.player,
                        ),
                    ],
                  ),
                if (controller.store.revealCards)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomFilledButtom(
                        expanded: false,
                        onPressed: controller.startGame,
                        text:
                            'Você ${controller.store.didPlayerLose ? 'perdeu! Tente' : 'venceu! Jogar'} de novo',
                      ),
                    ),
                  ),
                if (controller.store.isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.2),
                    child: const Center(
                      child: TextBoxWidget('Carregando...'),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
