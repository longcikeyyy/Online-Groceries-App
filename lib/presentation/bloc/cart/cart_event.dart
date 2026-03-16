abstract class CartEvent {}

/// Event to fetch user carts by user ID
class OnGetUserCarts extends CartEvent {
  final int userId;

  OnGetUserCarts({required this.userId});
}
