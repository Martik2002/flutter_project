import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  final String name;
  final double price;
  final String imageUrl;
  final DateTime lastUpdate;
  final double hight24Hour;
  final double low24Hours;

  @override
  List<Object?> get props => [name, price, imageUrl, lastUpdate,hight24Hour, low24Hours];
}
