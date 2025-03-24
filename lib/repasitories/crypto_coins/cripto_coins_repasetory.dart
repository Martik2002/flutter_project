import 'package:cripto_coins_list/repasitories/crypto_coins/cripto_coins.dart';
import 'package:cripto_coins_list/repasitories/crypto_coins/model/crypto_coin_details.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepasetory implements AbstractCoinsRepasetory {
  CryptoCoinsRepasetory({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,DOGE,ADA,BNB,XRP&tsyms=USD,EUR');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final cryptoCoinList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
          name: e.key,
          price: price,
          imageUrl: 'https://www.cryptocompare.com/$imageUrl');
    }).toList();

    return cryptoCoinList;
  }

  @override
  Future<CryptoCoinDetails> getCoinsDitels(String coinName) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$coinName&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final  coinData = dataRaw[coinName] as Map<String, dynamic>;
      final usdData = coinData['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      final lastUpdate =
          DateTime.fromMillisecondsSinceEpoch(usdData['LASTUPDATE']);
      final hight24Hour = usdData['HIGHDAY'];
      final low24Hours = usdData['LOWDAY'];
      return CryptoCoinDetails(
        name: coinName,
        price: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
        lastUpdate: lastUpdate,
        hight24Hour: hight24Hour,
        low24Hours: low24Hours,
      );
   
  }
}
