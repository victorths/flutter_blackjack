import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String code;
  final String image;
  final String value;
  final String suit;

  const CardEntity({
    required this.code,
    required this.image,
    required this.value,
    required this.suit,
  });

  @override
  List<Object?> get props => [code, image, value, suit];

  (int, int) get valueToRecord {
    final value = int.parse(this.value);
    return (value, value);
  }
}
