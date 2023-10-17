import 'package:flutter_blackjack/app/modules/home/data/infra/blackjack_datasouce.dart';
import 'package:flutter_blackjack/app/modules/home/domain/entities/card_entity.dart';
import 'package:flutter_blackjack/app/modules/home/domain/repositories/product_repository.dart';

class BlackjackRepositoryImpl implements BlackjackRepository {
  BlackjackRepositoryImpl({
    required this.datasource,
  });

  final BlackjackDatasource datasource;

  @override
  Future<List<CardEntity>> drawCards(String deckId, int count) =>
      datasource.drawCards(deckId, count);

  @override
  Future<String> newDeck() => datasource.newDeck();

  @override
  Future<bool> shuffleDeck(String deckId) => datasource.shuffleDeck(deckId);
}
