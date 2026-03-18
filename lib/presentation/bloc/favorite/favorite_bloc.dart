import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/domain/usecase/get_favorite_cart_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/favorite/favorite_event.dart';
import 'package:online_groceries_app/presentation/bloc/favorite/favorite_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';

/// BLoC for managing favorite cart (products in cart).
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteCartUsecase _getFavoriteCartUsecase;
  final FailureMapper _failureMapper;

  FavoriteBloc(this._getFavoriteCartUsecase, this._failureMapper)
    : super(const FavoriteState()) {
    on<OnGetFavoriteProducts>(_getFavoriteProducts);
  }

  Future<void> _getFavoriteProducts(
    OnGetFavoriteProducts event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      // Fetch cart with ID 1 (or use dynamic cartId based on user)
      final result = await _getFavoriteCartUsecase.call(
        GetFavoriteCartParams(cartId: 1),
      );
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              apiErrorMessage: _failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (success) {
          emit(state.copyWith(isLoading: false, favoriteProducts: success));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          apiErrorMessage: 'An unexpected error occurred.',
        ),
      );
    }
  }
}
