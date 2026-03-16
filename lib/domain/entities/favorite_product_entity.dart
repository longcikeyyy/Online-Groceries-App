import 'package:equatable/equatable.dart';

/// Entity representing a product in the favorite/cart list.
///
/// This entity is used to display products in the favorite screen with relevant
/// information from the shopping cart endpoint.
class FavoriteProductEntity extends Equatable {
  /// Unique identifier for the product
  final int id;

  /// Product title/name
  final String title;

  /// Product price as a string
  final String price;

  /// Quantity of the product in cart
  final int quantity;

  /// Total price for this item (price * quantity)
  final double total;

  /// Discount percentage applied
  final double discountPercentage;

  /// Final price after discount
  final double discountedTotal;

  /// Product thumbnail image URL
  final String thumbnail;

  const FavoriteProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        quantity,
        total,
        discountPercentage,
        discountedTotal,
        thumbnail,
      ];
}
