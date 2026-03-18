import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';
import 'package:online_groceries_app/di/injector.dart';
import 'package:online_groceries_app/domain/usecase/get_user_carts_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/cart/cart_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/cart/cart_event.dart';
import 'package:online_groceries_app/presentation/bloc/cart/cart_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';
import 'package:online_groceries_app/presentation/screens/cart/widgets/cart_item.dart';
import 'package:online_groceries_app/presentation/screens/cart/widgets/checkout_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartBloc(getIt<GetUserCartsUsecase>(), FailureMapper(context))
            ..add(OnGetUserCarts(userId: 15)),
      child: const CartScreenView(),
    );
  }
}

class CartScreenView extends StatelessWidget {
  const CartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: AppTextStyle.tsSemiBold24.copyWith(color: AppColor.blackColor),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.apiErrorMessage.isNotEmpty) {
            return Center(
              child: Text(
                state.apiErrorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state.cart == null || state.cart!.products.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          } else {
            return Stack(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                  itemCount: state.cart!.products.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 24,
                    thickness: 1,
                    color: Color(0xFFE2E2E2),
                  ),
                  itemBuilder: (context, index) {
                    final product = state.cart!.products[index];
                    return CartItem(product: product);
                  },
                ),
                CheckoutButton(totalPrice: state.cart!.total),
              ],
            );
          }
        },
      ),
    );
  }
}
