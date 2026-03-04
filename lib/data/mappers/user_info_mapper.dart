import 'package:online_groceries_app/data/models/response/user_info_dto.dart';
import 'package:online_groceries_app/domain/entities/user_info_entity.dart';

extension UserInfoMapper on UserInfoDto {
  /// Converts a [UserInfoDto] to a [UserInfoEntity].
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      id: id,
      fullName: '$firstName $lastName',
      email: email,
      avatarUrl: image,
    );
  }
}
