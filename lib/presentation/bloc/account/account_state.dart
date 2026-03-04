import 'package:equatable/equatable.dart';
import 'package:online_groceries_app/domain/entities/user_info_entity.dart';

class AccountState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final UserInfoEntity? userInfo;

  const AccountState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.userInfo,
  });

  AccountState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    UserInfoEntity? userInfo,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object?> get props => [isLoading, apiErrorMessage, userInfo];
}
