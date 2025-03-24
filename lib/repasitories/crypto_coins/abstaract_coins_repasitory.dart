import 'package:cripto_coins_list/repasitories/crypto_coins/model/crypto_coin.dart';
import 'package:cripto_coins_list/repasitories/crypto_coins/model/crypto_coin_details.dart';

abstract class AbstractCoinsRepasetory{
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetails> getCoinsDitels(String coinName);

}