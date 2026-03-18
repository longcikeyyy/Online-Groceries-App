import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/di/injector.dart';
import 'package:online_groceries_app/domain/usecase/get_shop_info_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_event.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';
import 'package:online_groceries_app/presentation/screens/shop/widgets/shop_category_section.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ShopBloc(getIt<GetShopInfoUsecase>(), FailureMapper(context))
            ..add(OnGetShopInfo()),
      child: const ShopScreenView(),
    );
  }
}

class ShopScreenView extends StatelessWidget {
  const ShopScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/icons/ic_carrot.png')),
      body: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.apiErrorMessage.isNotEmpty) {
            return Center(child: Text(state.apiErrorMessage));
          } else if (state.categorizedShopInfoList.isEmpty) {
            return const Center(child: Text('No shop info available.'));
          } else {
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.categorizedShopInfoList.length,
                itemBuilder: (context, index) {
                  final shopInfo = state.categorizedShopInfoList[index];
                  return ShopCategorySection(
                    categoryName: shopInfo.keys.first,
                    items: shopInfo.values.first,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
