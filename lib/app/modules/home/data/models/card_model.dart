import 'package:flutter_blackjack/app/commons/commons.dart';
import 'package:flutter_blackjack/app/modules/home/domain/entities/card_entity.dart';

part 'card_model.g.dart';

@JsonSerializable(createToJson: false)
class CardModel extends CardEntity {
  const CardModel({
    required super.code,
    required super.image,
    required super.suit,
    required super.value,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}
