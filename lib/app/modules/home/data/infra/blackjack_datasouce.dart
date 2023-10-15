import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/data/models/card_model.dart';

class BlackjackDatasource {
  BlackjackDatasource({
    required this.remoteDatasource,
  });

  final RemoteDatasource remoteDatasource;

  Future<String> newDeck() async {
    try {
      final response =
          await remoteDatasource.get(url: '/deck/new/shuffle/?deck_count=1');
      if (response.data['success']) {
        return response.data['deck_id'];
      } else {
        throw Exception(
            'Error on create a new deck from remote datasouce: ${response.data['error']}');
      }
    } catch (e) {
      throw Exception(
          'Error on create a new deck from remote datasouce: ${e.toString()}');
    }
  }

  Future<bool> shuffleDeck(String deckId) async {
    try {
      final response =
          await remoteDatasource.get(url: '/deck/$deckId/shuffle/');
      if (response.data['success']) {
        return true;
      } else {
        throw Exception(
            'Error on shuffle deck from remote datasouce: ${response.data['error']}');
      }
    } catch (e) {
      throw Exception(
          'Error on shuffle deck from remote datasouce: ${e.toString()}');
    }
  }

  Future<List<CardModel>> drawCards(String deckId, int count) async {
    try {
      final response =
          await remoteDatasource.get(url: '/deck/$deckId/draw/?count=$count');
      if (response.data['cards'] != null) {
        return response.data['cards']
            .cast<Map<String, dynamic>>()
            .map<CardModel>((json) => CardModel.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(
          'Error drawing cards from remote datasouce: ${e.toString()}');
    }
  }
}
