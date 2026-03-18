import 'package:equatable/equatable.dart';
import 'package:online_groceries_app/domain/entities/product_detail_entity.dart';

class ProductDetailState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final ProductDetailEntity? product;
  final bool isFavorite;
  final int quantity;

  const ProductDetailState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.product,
    this.isFavorite = false,
    this.quantity = 1,
  });

  ProductDetailState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    ProductDetailEntity? product,
    bool? isFavorite,
    int? quantity,
  }) {
    return ProductDetailState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      product: product ?? this.product,
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    apiErrorMessage,
    product,
    isFavorite,
    quantity,
  ];
}
