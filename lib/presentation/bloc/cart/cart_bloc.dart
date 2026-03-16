import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/domain/usecase/get_user_carts_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/cart/cart_event.dart';
import 'package:online_groceries_app/presentation/bloc/cart/cart_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';

/// BLoC for managing user cart.
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetUserCartsUsecase _getUserCartsUsecase;
  final FailureMapper _failureMapper;

  CartBloc(this._getUserCartsUsecase, this._failureMapper)
    : super(const CartState()) {
    on<OnGetUserCarts>(_getUserCarts);
  }

  Future<void> _getUserCarts(
    OnGetUserCarts event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await _getUserCartsUsecase.call(
        GetUserCartsParams(userId: event.userId),
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
          emit(state.copyWith(isLoading: false, cart: success));
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
