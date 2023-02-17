import 'package:bloc/bloc.dart';
import 'package:crypto_converter/features/crypto_list/domain/entities/coin.entity.dart';
import 'package:crypto_converter/features/crypto_list/domain/usecases/get_coins_list.usecase.dart';
import 'package:meta/meta.dart';

part 'crypto_list.event.dart';
part 'crypto_list.state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final IGetCoinsListUseCase getCoinsListUseCase;

  CryptoListBloc({
    required this.getCoinsListUseCase,
  }) : super(CryptoListInitialState()) {
    on<GetCryptoListEvent>((event, emit) async {
      final result = await getCoinsListUseCase();

      emit(CryptoListLoadingState());

      result.fold(
        (l) => emit(CryptoListErrorState(errorMessage: l.message)),
        (r) => emit(CryptoListLoadedState(coinsList: r)),
      );
    });
    add(GetCryptoListEvent());
  }
}
