import 'package:equatable/equatable.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';

class ShopState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final List<ShopInfoEntity> shopInfoList;

  const ShopState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.shopInfoList = const [],
  });

  ShopState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    List<ShopInfoEntity>? shopInfoList,
  }) {
    return ShopState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      shopInfoList: shopInfoList ?? this.shopInfoList,
    );
  }

  @override
  List<Object?> get props => [isLoading, apiErrorMessage, shopInfoList];
}
