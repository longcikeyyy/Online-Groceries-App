import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String avatarUrl;

  const UserInfoEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [id, fullName, email, avatarUrl];
}
