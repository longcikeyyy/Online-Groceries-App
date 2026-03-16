import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/core/usecase.dart';
import 'package:online_groceries_app/domain/entities/cart_entity.dart';
import 'package:online_groceries_app/domain/repositories/favorite_cart_repository.dart';

/// Usecase for fetching cart for a specific user.
///
/// This usecase retrieves cart information for a user,
/// including all products in the cart and total.
final class GetUserCartsUsecase
    extends UsecaseAsync<CartEntity, GetUserCartsParams> {
  final IFavoriteCartRepository _repository;

  GetUserCartsUsecase(this._repository);

  @override
  ResultFuture<CartEntity> call(GetUserCartsParams params) {
    return _repository.getUserCarts(params.userId);
  }
}

/// Parameters for [GetUserCartsUsecase].
final class GetUserCartsParams {
  /// The ID of the user whose carts to fetch
  final int userId;

  GetUserCartsParams({required this.userId});
}
