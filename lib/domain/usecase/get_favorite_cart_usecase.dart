import 'package:injectable/injectable.dart';
import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/core/usecase.dart';
import 'package:online_groceries_app/domain/entities/favorite_product_entity.dart';
import 'package:online_groceries_app/domain/repositories/favorite_cart_repository.dart';

/// Usecase for fetching favorite cart (products in cart).
@injectable
final class GetFavoriteCartUsecase
    extends UsecaseAsync<List<FavoriteProductEntity>, GetFavoriteCartParams> {
  final IFavoriteCartRepository _repository;

  GetFavoriteCartUsecase(this._repository);

  @override
  ResultFuture<List<FavoriteProductEntity>> call(GetFavoriteCartParams params) {
    return _repository.getFavoriteCart(params.cartId);
  }
}

/// Parameters for [GetFavoriteCartUsecase].
final class GetFavoriteCartParams {
  final int cartId;

  GetFavoriteCartParams({required this.cartId});
}
