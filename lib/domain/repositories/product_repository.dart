import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';

/// Repository interface for authentication operations.
///
/// This abstract class defines the contract for authentication-related
/// data operations, providing a clean separation between the domain
/// layer and data layer.
abstract class IProductRepository {
  /// Retrieves a list of all shop products.
  ///
  /// Returns a [ResultFuture<List<ShopInfoEntity>>] containing a list of
  /// all available products from the shop.
  ResultFuture<List<ShopInfoEntity>> getShopInfo();
}
