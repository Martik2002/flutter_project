import 'dart:async';

import 'package:cripto_coins_list/features/crypyo_list/bloc/crypto_list_bloc.dart';
import 'package:cripto_coins_list/features/crypyo_list/widgets/widgets.dart';
import 'package:cripto_coins_list/repasitories/crypto_coins/cripto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoProjectScreen extends StatefulWidget {
  const CryptoProjectScreen({
    super.key,
  });

  @override
  State<CryptoProjectScreen> createState() => _CryptoProjectScreenState();
}

class _CryptoProjectScreenState extends State<CryptoProjectScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepasetory>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("CryptoProject")),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) =>
                          TalkerScreen(talker: GetIt.I<Talker>()))));
                },
                icon: const Icon(Icons.document_scanner_outlined))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final compleater = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: compleater));
            return compleater.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: state.coinList.length,
                  itemBuilder: (context, i) {
                    final coin = state.coinList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Something went wrong',
                        style: theme.textTheme.headlineMedium),
                    Text(
                      'Please try agin latle',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                    TextButton(
                        onPressed: () {
                          _cryptoListBloc.add(LoadCryptoList());
                        },
                        child: const Text('Try again'))
                  ],
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
