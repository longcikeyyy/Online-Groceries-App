import 'package:online_groceries_app/data/models/response/favorite_cart_dto.dart';
import 'package:online_groceries_app/domain/entities/favorite_product_entity.dart';

/// Extension to map CartItemDto to FavoriteProductEntity for displaying favorites
extension CartItemMapper on CartItemDto {
  FavoriteProductEntity toEntity() {
    return FavoriteProductEntity(
      id: id,
      title: title,
      price: price.toString(),
      quantity: quantity,
      total: total,
      discountPercentage: discountPercentage,
      discountedTotal: discountedTotal,
      thumbnail: thumbnail,
    );
  }
}
