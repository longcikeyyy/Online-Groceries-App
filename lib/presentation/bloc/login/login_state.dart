import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final bool isSuccess;
  final bool isPasswordVisible;

  const LoginState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.isSuccess = false,
    this.isPasswordVisible = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    bool? isSuccess,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    apiErrorMessage,
    isSuccess,
    isPasswordVisible,
  ];
}
