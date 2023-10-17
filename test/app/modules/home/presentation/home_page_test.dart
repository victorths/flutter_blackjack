import 'package:flutter_blackjack/app/app_module.dart';
import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/domain/entities/card_entity.dart';
import 'package:flutter_blackjack/app/modules/home/domain/repositories/product_repository.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/home_controller.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/home_module.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/home_page.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/home_store.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/widgets/action_buttons.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/widgets/card.dart';
import 'package:flutter_blackjack/app/modules/home/presentation/widgets/text_box.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BlackjackRepositoryImpl extends Mock implements BlackjackRepository {}

const cards = [
  CardEntity(
    code: '9S',
    image: 'https://deckofcardsapi.com/static/img/9S.png',
    value: '9',
    suit: 'SPADES',
  ),
  CardEntity(
    code: '3H',
    image: 'https://deckofcardsapi.com/static/img/3H.png',
    value: '3',
    suit: 'HEARTS',
  ),
  CardEntity(
    code: 'JH',
    image: 'https://deckofcardsapi.com/static/img/JH.png',
    value: 'JACK',
    suit: 'HEARTS',
  ),
];

const String deckId = '9waq73xafmay';

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: HomePage(),
    ),
  );

  await tester.pumpAndSettle();
}

Future<void> _startGame(WidgetTester tester) async {
  await _createWidget(tester);
  // Start the game
  await tester.ensureVisible(find.byType(CustomFilledButtom));
  final starButtom = find.byType(CustomFilledButtom);

  await tester.tap(starButtom);

  await tester.pumpAndSettle();

  // Check Loading
  expect(find.byType(TextBoxWidget), findsOneWidget);

  await tester.pump(const Duration(seconds: 1));
}

void main() {
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());
  // Mock the repository to avoid API calls durint widget tests
  final blackJackRepository = BlackjackRepositoryImpl();
  Modular.replaceInstance<HomeController>(
    HomeController(store: HomeStore(), repository: blackJackRepository),
  );

  // Mock Setup
  when(
    () => blackJackRepository.newDeck(),
  ).thenAnswer(
    (_) async {
      await Future.delayed(
        const Duration(milliseconds: 500),
      );
      return deckId;
    },
  );
  when(
    () => blackJackRepository.drawCards(deckId, 2),
  ).thenAnswer((_) => Future.value([cards[0], cards[1]]));
  when(
    () => blackJackRepository.drawCards(deckId, 1),
  ).thenAnswer((_) => Future.value([cards[2]]));

  testWidgets('Initialization', (tester) async {
    await _createWidget(tester);
    // Check if dependencies was injected
    final homeController = Modular.get<HomeController>();

    expect(homeController, isNotNull);
    expect(find.image(const AssetImage(Assets.board)), findsOneWidget);
    expect(find.byType(CustomFilledButtom), findsOneWidget);
  });

  testWidgets('Start the game and draw a card', (tester) async {
    await _startGame(tester);

    // Check if the game was started
    expect(find.byType(TextBoxWidget), findsAtLeastNWidgets(2));

    expect(find.byType(CardWidget), findsAtLeastNWidgets(4));

    final drawCardButton = find.byType(DrawCardButton);
    final playerPointsText = find.text('12');
    final boardPointsText = find.text('9');
    final stopButton = find.byType(StopButton);
    expect(drawCardButton, findsOneWidget);
    expect(stopButton, findsOneWidget);

    // Both players drew the same cards but the board only reveals the first one
    expect(playerPointsText, findsAtLeastNWidgets(1));
    expect(boardPointsText, findsAtLeastNWidgets(1));

    // Try to draw card
    await tester.tap(drawCardButton);

    await tester.pumpAndSettle();
    // Check if there is 6 cards in total
    expect(find.byType(CardWidget), findsAtLeastNWidgets(6));

    final playerNewPointsText = find.text('22');
    expect(playerNewPointsText, findsAtLeastNWidgets(1));

    // the player have 22 points so the lose messaging should appear with the try again button
    final tryAgainButton = find.byType(CustomFilledButtom);
    expect(tryAgainButton, findsOneWidget);
  });
}
