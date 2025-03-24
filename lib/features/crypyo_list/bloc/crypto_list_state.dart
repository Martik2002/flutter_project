part of 'crypto_list_bloc.dart';
 
 abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinList});

  final List<CryptoCoin> coinList;
    @override
  List<Object?> get props => [coinList];
}

class CryptoListLoadingFailure extends CryptoListState{

  CryptoListLoadingFailure({required this.exception});
  
  final Object? exception;
  @override
  List<Object?> get props => [exception];
}
