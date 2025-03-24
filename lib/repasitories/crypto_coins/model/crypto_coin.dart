import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.imageUrl, 
    required this.name, 
    required this.price
  });

  final String name;
  final double price;
  final String imageUrl;
  
  @override
  List<Object?> get props => [name, price, imageUrl];
}
