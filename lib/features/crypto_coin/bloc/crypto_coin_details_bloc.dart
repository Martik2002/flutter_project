import 'package:cripto_coins_list/repasitories/crypto_coins/cripto_coins.dart';
import 'package:cripto_coins_list/repasitories/crypto_coins/model/crypto_coin_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<LoadCryptoCoinDetails, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepasetory) : super(CryptoCoinDetailsInitial()) {
    on<LoadCryptoCoinDetails>((event, emit) async {
      try {
        if (state is! CryptoCoinDetailsLoading) {
          emit(CryptoCoinDetailsLoading());
        }
        final coin = await coinsRepasetory.getCoinsDitels(event.currencyCode);
        emit(CryptoCoinDetailsLoaded(coin: coin));
      } catch (e, st) {
        emit(CryptoCoinDetailsLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
  final AbstractCoinsRepasetory coinsRepasetory;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
