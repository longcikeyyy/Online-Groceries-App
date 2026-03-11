import 'package:equatable/equatable.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';

class ShopState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final List<Map<String, List<ShopInfoEntity>>> categorizedShopInfoList;

  const ShopState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.categorizedShopInfoList = const [],
  });

  ShopState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    List<Map<String, List<ShopInfoEntity>>>? categorizedShopInfoList,
  }) {
    return ShopState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      categorizedShopInfoList:
          categorizedShopInfoList ?? this.categorizedShopInfoList,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    apiErrorMessage,
    categorizedShopInfoList,
  ];
}
