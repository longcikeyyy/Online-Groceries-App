import 'package:injectable/injectable.dart';
import 'package:online_groceries_app/data/core/guard.dart';
import 'package:online_groceries_app/data/datasources/remote/api_service.dart';
import 'package:online_groceries_app/data/mappers/favorite_cart_mapper.dart';
import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/entities/cart_entity.dart';
import 'package:online_groceries_app/domain/entities/favorite_product_entity.dart';
import 'package:online_groceries_app/domain/repositories/favorite_cart_repository.dart';

/// Implementation of [IFavoriteCartRepository] for handling favorite cart operations.
@LazySingleton(as: IFavoriteCartRepository)
class FavoriteCartRepositoryImpl extends IFavoriteCartRepository {
  final ApiService _apiService;

  FavoriteCartRepositoryImpl(this._apiService);

  @override
  ResultFuture<List<FavoriteProductEntity>> getFavoriteCart(int cartId) {
    return guardDio<List<FavoriteProductEntity>>(() async {
      final dto = await _apiService.getCart(cartId);
      // Map each CartItemDto to FavoriteProductEntity for display
      return dto.products.map((item) => item.toEntity()).toList();
    });
  }

  @override
  ResultFuture<CartEntity> getUserCarts(int userId) {
    return guardDio<CartEntity>(() async {
      final dto = await _apiService.getUserCarts(userId);
      return dto.toEntity();
    });
  }
}
