import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/entities/favorite_product_entity.dart';

/// Repository interface for handling favorite cart (products in cart) operations.
abstract class IFavoriteCartRepository {
  /// Fetch favorite cart (list of products) by cart ID
  ///
  /// Returns a [ResultFuture] containing a list of [FavoriteProductEntity]
  /// representing the products in the cart, or a [Failure] if the operation fails.
  ResultFuture<List<FavoriteProductEntity>> getFavoriteCart(int cartId);
}

