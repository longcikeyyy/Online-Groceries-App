import 'package:equatable/equatable.dart';
import 'package:online_groceries_app/domain/entities/favorite_product_entity.dart';

class FavoriteState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final List<FavoriteProductEntity> favoriteProducts;

  const FavoriteState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.favoriteProducts = const [],
  });

  FavoriteState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    List<FavoriteProductEntity>? favoriteProducts,
  }) {
    return FavoriteState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }

  @override
  List<Object?> get props => [isLoading, apiErrorMessage, favoriteProducts];
}
