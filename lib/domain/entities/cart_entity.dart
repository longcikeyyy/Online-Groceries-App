import 'package:equatable/equatable.dart';
import 'package:online_groceries_app/domain/entities/favorite_product_entity.dart';

/// Entity representing a shopping cart.
///
/// This entity includes the cart ID, list of products, and total price.
class CartEntity extends Equatable {
  /// Unique identifier for the cart
  final int id;

  /// List of products in the cart
  final List<FavoriteProductEntity> products;

  /// Total price
  final double total;

  const CartEntity({
    required this.id,
    required this.products,
    required this.total,
  });

  @override
  List<Object?> get props => [id, products, total];
}
