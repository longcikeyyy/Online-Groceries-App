import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';
import 'package:online_groceries_app/di/injector.dart';
import 'package:online_groceries_app/domain/usecase/get_favorite_cart_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/favorite/favorite_event.dart';
import 'package:online_groceries_app/presentation/bloc/favorite/favorite_state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoriteBloc(getIt<GetFavoriteCartUsecase>())
            ..add(OnGetFavoriteProducts()),
      child: const FavoriteScreenView(),
    );
  }
}

class FavoriteScreenView extends StatelessWidget {
  const FavoriteScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite',style:AppTextStyle.tsSemiBold24),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.apiErrorMessage.isNotEmpty) {
            return Center(child: Text(state.apiErrorMessage));
          } else if (state.favoriteProducts.isEmpty) {
            return const Center(child: Text('No favorite products.'));
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.favoriteProducts.length,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 24,
                  thickness: 1,
                  color: Colors.grey[300],
                );
              },
              itemBuilder: (context, index) {
                final product = state.favoriteProducts[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    
                  ),
                  child: Row(
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.network(
                          product.thumbnail,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child:  Icon(Icons.image_not_supported),
                            );
                          },
                        ),
                      ),
                      // Product Info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Qty: ${product.quantity}',
                                style: TextStyle(
                                  color:AppColor.greyColor,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              
                            ],
                          ),
                        ),
                      ),
                      // Action Icon
                      Row(
                        children: [
                          Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColor.blackColor
                                ),
                              ),
                          Icon(
                            Icons.chevron_right,
                            color: AppColor.blackColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
