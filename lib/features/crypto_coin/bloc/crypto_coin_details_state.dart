
 

part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsState extends Equatable {}

class CryptoCoinDetailsInitial extends CryptoCoinDetailsState{
  @override
  List<Object?> get props => [];

}
class CryptoCoinDetailsLoading extends CryptoCoinDetailsState{
  @override
  List<Object?> get props => [];
}
class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState{
  CryptoCoinDetailsLoaded({required this.coin});
  
  final CryptoCoinDetails coin;
    @override
  List<Object?> get props => [coin];
}
class CryptoCoinDetailsLoadingFailure extends CryptoCoinDetailsState{

  CryptoCoinDetailsLoadingFailure({required this.exception});
  
  final Object? exception;
  @override
  List<Object?> get props => [exception];
}
