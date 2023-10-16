import '../../../commons/commons.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularInjector<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                Assets.board,
                width: size.width,
              ),
              if (controller.store.deckId == null)
                CustomFilledButtom(
                  expanded: false,
                  onPressed: controller.startGame,
                  text: 'Iniciar Jogo',
                  size: CustomFilledButtomSize.large,
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.store.player.points.$1.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.store.player.cards
                          .map(
                            (card) => CustomCachedNetworkImage(
                              image: card.image,
                              size: Size(40, 100),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
