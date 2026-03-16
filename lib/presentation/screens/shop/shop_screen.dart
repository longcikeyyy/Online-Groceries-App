import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';
import 'package:online_groceries_app/di/injector.dart';
import 'package:online_groceries_app/domain/usecase/get_shop_info_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_event.dart';
import 'package:online_groceries_app/presentation/bloc/shop/shop_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';

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
            // Display the list of shop info
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.categorizedShopInfoList.length,
                itemBuilder: (context, index) {
                  final shopInfo = state.categorizedShopInfoList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(shopInfo.keys.first,style:AppTextStyle.tsSemiBold24), // Display category name
                      SizedBox(
                        height: 150,
                        width: 400,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: shopInfo.values.first.length,
                          itemBuilder: (context, index) {
                            final item = shopInfo.values.first[index];
                            return Container(
                              width: (174 / 414) * MediaQuery.of(context).size.width,
                              height: (249 / 1553) * MediaQuery.of(context).size.height,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(18),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha:0),
                                    spreadRadius: 0,
                                    blurRadius: 12,
                                    offset: const Offset(0, 6), // changes position of shadow
                                  ),
                                ]
                              ),
                              child: Column(
                                children: [
                                  Image.network(item.imageUrl, height: 80),
                                  Text(
                                    item.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(item.price),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
