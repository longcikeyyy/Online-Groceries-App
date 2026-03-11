import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_state.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/icons/ic_carrot.png')),
      body: BlocBuilder<ShopBloc, ShopState>(
        builder:(context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.apiErrorMessage.isNotEmpty) {
            return Center(child: Text(state.apiErrorMessage));
          } else if (state.shopInfoList.isEmpty) {
            return const Center(child: Text('No shop info available.'));
          } else {
            // Display the list of shop info
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.shopInfoList.length,
                itemBuilder: (context, index) {
                  final shopInfo = state.shopInfoList[index];
                  return ListTile(
                    leading: Image.network(
                      shopInfo.imageUrl,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    title: Text(shopInfo.title),
                    subtitle: Text('${shopInfo.price} - ${shopInfo.weight}'),
                  );
                },
              ),
            );
          }
         }
      )
    );
  }
}
