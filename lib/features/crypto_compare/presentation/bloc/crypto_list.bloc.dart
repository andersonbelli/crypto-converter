import 'package:bloc/bloc.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/coin.entity.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/simple_price.entity.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/supported_currency.entity.dart';
import 'package:crypto_converter/features/crypto_compare/domain/usecases/get_coins_list.usecase.dart';
import 'package:crypto_converter/features/crypto_compare/domain/usecases/get_simple_price.usecase.dart';
import 'package:crypto_converter/features/crypto_compare/domain/usecases/get_supported_currencies_list.usecase.dart';
import 'package:meta/meta.dart';

part 'crypto_list.event.dart';
part 'crypto_list.state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final IGetCoinsListUseCase getCoinsListUseCase;
  final IGetSupportedCurrenciesUseCase getSupportedCurrenciesUseCase;
  final IGetSimplePriceUseCase getSimplePriceUseCase;

  Coin? selectedCoin;
  List<Coin> coinsList = [];
  SupportedCurrency? selectedSupportedCurrency;
  List<SupportedCurrency> supportedCurrenciesList = [];

  CryptoListBloc({
    required this.getCoinsListUseCase,
    required this.getSupportedCurrenciesUseCase,
    required this.getSimplePriceUseCase,
  }) : super(InitialState()) {
    on<GetCryptoListEvent>((event, emit) async {
      emit(LoadingState());

      final result = await getCoinsListUseCase();

      result.fold(
        (l) => emit(ErrorState(errorMessage: l.message)),
        (r) {
          coinsList = r;
          emit(CoinsListLoadedState());
        },
      );
    });
    on<SelectCoinEvent>((event, emit) async {
      selectedCoin = event.selectedCoin;

      emit(CoinSelectedState());
    });
    on<GetSupportedCurrenciesListEvent>((event, emit) async {
      emit(LoadingState());

      final result = await getSupportedCurrenciesUseCase();

      result.fold(
        (l) => emit(ErrorState(errorMessage: l.message)),
        (r) {
          supportedCurrenciesList = r;
          emit(SupportedCurrenciesListLoadedState());
        },
      );
    });
    on<SelectSupportedCurrencyEvent>((event, emit) async {
      selectedSupportedCurrency = event.selectedSupportedCurrency;

      emit(SupportedCurrencySelectedState());
    });
    on<ResetEvent>((event, emit) async {
      selectedCoin = null;
      coinsList.clear();
      selectedSupportedCurrency = null;
      supportedCurrenciesList.clear();
      add(GetCryptoListEvent());
    });
    on<CompareCoinsEvent>((event, emit) async {
      emit(LoadingState());

      final result = await getSimplePriceUseCase(
        coinId: selectedCoin?.id ?? '',
        currencyName: selectedSupportedCurrency?.name ?? '',
      );

      result.fold(
        (l) => emit(ErrorState(errorMessage: l.message)),
        (r) => emit(ComparePricesState(compareCoin: r)),
      );
    });
    add(GetCryptoListEvent());
  }
}
