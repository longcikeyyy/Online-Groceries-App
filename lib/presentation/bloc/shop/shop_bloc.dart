import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/domain/core/usecase.dart';
import 'package:online_groceries_app/domain/usecase/get_shop_info_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_event.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';


class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final GetShopInfoUsecase _getShopInfoUsecase;
  final FailureMapper _failureMapper;

  ShopBloc(this._getShopInfoUsecase, this._failureMapper)
    : super(const ShopState()) {
    on<OnGetShopInfo>(_getShopInfo);
  }

  Future<void> _getShopInfo(
    OnGetShopInfo event,
    Emitter<ShopState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await _getShopInfoUsecase.call(NoParams());
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
          // success is List<ShopInfoEntity>
          emit(state.copyWith(isLoading: false, shopInfoList: success));
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
