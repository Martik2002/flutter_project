import 'package:cripto_coins_list/router/router.dart';
import 'package:cripto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptocurrenciesListApp extends StatelessWidget {
  const CryptocurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'CryptoProject',
    theme: darkTheme,
    routes: routers,
    navigatorObservers: [
      TalkerRouteObserver(GetIt.I<Talker>())
    ],
  );
}}
