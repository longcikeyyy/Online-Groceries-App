import 'package:equatable/equatable.dart';
import 'package:online_groceries_app/domain/entities/cart_entity.dart';

class CartState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final CartEntity? cart;

  const CartState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.cart,
  });

  CartState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    CartEntity? cart,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      cart: cart ?? this.cart,
    );
  }

  @override
  List<Object?> get props => [isLoading, apiErrorMessage, cart];
}
