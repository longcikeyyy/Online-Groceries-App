import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/domain/usecase/get_product_detail_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/product_detail/product_detail_event.dart';
import 'package:online_groceries_app/presentation/bloc/product_detail/product_detail_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetailUsecase _getProductDetailUsecase;
  final FailureMapper _failureMapper;

  ProductDetailBloc(this._getProductDetailUsecase, this._failureMapper)
    : super(const ProductDetailState()) {
    on<OnGetProductDetail>(_onGetProductDetail);
    on<OnToggleFavorite>(_onToggleFavorite);
    on<OnChangeQuantity>(_onChangeQuantity);
  }

  Future<void> _onGetProductDetail(
    OnGetProductDetail event,
    Emitter<ProductDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, apiErrorMessage: ''));
      final result = await _getProductDetailUsecase.call(
        GetProductDetailParams(event.productId),
      );
      result.fold(
        (failure) => emit(
          state.copyWith(
            isLoading: false,
            apiErrorMessage: _failureMapper.mapFailureToMessage(failure),
          ),
        ),
        (product) => emit(state.copyWith(isLoading: false, product: product)),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, apiErrorMessage: e.toString()));
    }
  }

  void _onToggleFavorite(
    OnToggleFavorite event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }

  void _onChangeQuantity(
    OnChangeQuantity event,
    Emitter<ProductDetailState> emit,
  ) {
    if (event.quantity < 1) return;
    emit(state.copyWith(quantity: event.quantity));
  }
}
