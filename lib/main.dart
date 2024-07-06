import 'dart:async';

import 'package:cripto_coins_list/crypto_coin_list_app.dart';
import 'package:cripto_coins_list/repasitories/crypto_coins/cripto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('talker started...');
  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
        printRequestData: false,
        printResponseHeaders: false,
        printRequestHeaders: false,
      ),
    ),
  );

Bloc.observer = TalkerBlocObserver(
  talker: talker,
  settings: const TalkerBlocLoggerSettings(
    printEventFullData: false,
    printStateFullData: false,
  )
  
  );

  GetIt.I.registerLazySingleton<AbstractCoinsRepasetory>(
      () => CryptoCoinsRepasetory(dio: dio));

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

//runApp(const CryptocurrenciesListApp());
  runZonedGuarded(
    () => runApp(const CryptocurrenciesListApp()),
    (e, st) => GetIt.I<Talker>().handle(e, st),
  );
}
