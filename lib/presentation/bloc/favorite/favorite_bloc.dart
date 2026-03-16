import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_groceries_app/domain/core/failures.dart';
import 'package:online_groceries_app/domain/usecase/get_favorite_cart_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/favorite/favorite_event.dart';
import 'package:online_groceries_app/presentation/bloc/favorite/favorite_state.dart';

/// BLoC for managing favorite cart (products in cart).
@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteCartUsecase _getFavoriteCartUsecase;

  FavoriteBloc(this._getFavoriteCartUsecase) : super(const FavoriteState()) {
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
              apiErrorMessage: _mapFailureToMessage(failure),
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
          apiErrorMessage: 'An unexpected error occurred: ${e.toString()}',
        ),
      );
    }
  }

  /// Maps failure objects to user-friendly error messages
  String _mapFailureToMessage(Failures failure) {
    return switch (failure) {
      NetworkFailure() => 'Network connection failed. Please check your internet.',
      ServerFailure(:final message) => message ?? 'Server error occurred.',
      NoInternetConnectionFailure() => 'No internet connection. Please connect and try again.',
      UnauthorizedFailure() => 'You are not authorized. Please login again.',
      ForbiddenFailure() => 'Access forbidden.',
      CacheFailure() => 'Cache error occurred.',
      UnknownFailure() => 'An unknown error occurred.',
      _ => 'An unexpected error occurred.',
    };
  }
}
