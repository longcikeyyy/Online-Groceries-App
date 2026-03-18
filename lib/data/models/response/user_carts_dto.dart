import 'package:json_annotation/json_annotation.dart';
import 'package:online_groceries_app/data/models/response/favorite_cart_dto.dart';

part 'user_carts_dto.g.dart';

/// Data transfer object representing the response for user carts endpoint.
///
/// This class encapsulates the paginated list of user carts along with
/// pagination metadata (total, skip, limit).
///
/// Example response:
/// ```json
/// {
///   "carts": [...],
///   "total": 1,
///   "skip": 0,
///   "limit": 1
/// }
/// ```
@JsonSerializable()
class UserCartsDto {
  final List<CartDto> carts;
  final int total;
  final int skip;
  final int limit;

  UserCartsDto({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory UserCartsDto.fromJson(Map<String, dynamic> json) =>
      _$UserCartsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserCartsDtoToJson(this);
}
