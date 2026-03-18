import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';
import 'package:online_groceries_app/di/injector.dart';
import 'package:online_groceries_app/domain/usecase/get_product_detail_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/product_detail/product_detail_event.dart';
import 'package:online_groceries_app/presentation/bloc/product_detail/product_detail_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_add_to_basket_button.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_detail_expandable.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_image_carousel.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_info_row.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_nutrition_section.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_quantity_selector.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_review_section.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_title_section.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailBloc(
        getIt<GetProductDetailUsecase>(),
        FailureMapper(context),
      )..add(OnGetProductDetail(productId)),
      child: const ProductDetailScreenView(),
    );
  }
}

class ProductDetailScreenView extends StatelessWidget {
  const ProductDetailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.textColor),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Product Detail',
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share, color: AppColor.textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.apiErrorMessage.isNotEmpty) {
            return Center(child: Text(state.apiErrorMessage));
          } else if (state.product == null) {
            return const Center(child: Text('Product not found.'));
          }
          return _ProductDetailBody(state: state);
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state.product == null) return const SizedBox.shrink();
          return ProductAddToBasketButton(onTap: () {});
        },
      ),
    );
  }
}

class _ProductDetailBody extends StatelessWidget {
  final ProductDetailState state;

  const _ProductDetailBody({required this.state});

  @override
  Widget build(BuildContext context) {
    final product = state.product!;
    final bloc = context.read<ProductDetailBloc>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image carousel
          Container(
            color: AppColor.imageBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ProductImageCarousel(images: product.images),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + favorite
                ProductTitleSection(
                  title: product.title,
                  weight: product.weight,
                  isFavorite: state.isFavorite,
                  onFavoriteTap: () => bloc.add(OnToggleFavorite()),
                ),

                const SizedBox(height: 20),

                // Quantity + price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductQuantitySelector(
                      quantity: state.quantity,
                      onDecrement: () =>
                          bloc.add(OnChangeQuantity(state.quantity - 1)),
                      onIncrement: () =>
                          bloc.add(OnChangeQuantity(state.quantity + 1)),
                    ),
                    Text(
                      '\$${(product.price * state.quantity).toStringAsFixed(2)}',
                      style: AppTextStyle.tsBold18.copyWith(fontSize: 24),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Product detail expandable
                ProductDetailExpandable(
                  title: 'Product Detail',
                  initiallyExpanded: true,
                  content: Text(
                    product.description,
                    style: AppTextStyle.tsRegular14Grey,
                  ),
                ),

                // Nutritions
                const ProductNutritionSection(),

                // Reviews
                ProductReviewSection(
                  reviews: product.reviews,
                  rating: product.rating,
                ),

                const SizedBox(height: 16),

                // Extra info
                ProductInfoRow('Brand', product.brand),
                const SizedBox(height: 8),
                ProductInfoRow('Availability', product.availabilityStatus),
                const SizedBox(height: 8),
                ProductInfoRow('Shipping', product.shippingInformation),
                const SizedBox(height: 8),
                ProductInfoRow('Return Policy', product.returnPolicy),
                const SizedBox(height: 8),
                ProductInfoRow('Warranty', product.warrantyInformation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
