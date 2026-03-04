import 'package:json_annotation/json_annotation.dart';

part 'user_info_dto.g.dart';

/// Data transfer object representing user hair information.
@JsonSerializable()
class HairDto {
  final String color;
  final String type;

  HairDto({required this.color, required this.type});

  factory HairDto.fromJson(Map<String, dynamic> json) =>
      _$HairDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HairDtoToJson(this);
}

/// Data transfer object representing geographical coordinates.
@JsonSerializable()
class CoordinatesDto {
  final double lat;
  final double lng;

  CoordinatesDto({required this.lat, required this.lng});

  factory CoordinatesDto.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesDtoToJson(this);
}

/// Data transfer object representing an address.
@JsonSerializable()
class AddressDto {
  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final CoordinatesDto coordinates;
  final String country;

  AddressDto({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);
}

/// Data transfer object representing bank information.
@JsonSerializable()
class BankDto {
  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  BankDto({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  factory BankDto.fromJson(Map<String, dynamic> json) =>
      _$BankDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BankDtoToJson(this);
}

/// Data transfer object representing company information.
@JsonSerializable()
class CompanyDto {
  final String department;
  final String name;
  final String title;
  final AddressDto address;

  CompanyDto({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  factory CompanyDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDtoToJson(this);
}

/// Data transfer object representing cryptocurrency information.
@JsonSerializable()
class CryptoDto {
  final String coin;
  final String wallet;
  final String network;

  CryptoDto({required this.coin, required this.wallet, required this.network});

  factory CryptoDto.fromJson(Map<String, dynamic> json) =>
      _$CryptoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoDtoToJson(this);
}

/// Data transfer object representing complete user information.
///
/// This class encapsulates all the user profile data including personal
/// information, address, bank details, company information, and more.
/// It uses JSON serialization to convert between Dart objects and JSON data.
///
/// Example usage:
/// ```dart
/// final userInfo = UserInfoDto.fromJson(jsonResponse);
/// print('Welcome ${userInfo.firstName} ${userInfo.lastName}!');
/// ```
@JsonSerializable()
class UserInfoDto {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final double height;
  final double weight;
  final String eyeColor;
  final HairDto hair;
  final String ip;
  final AddressDto address;
  final String macAddress;
  final String university;
  final BankDto bank;
  final CompanyDto company;
  final String ein;
  final String ssn;
  final String userAgent;
  final CryptoDto crypto;
  final String role;

  UserInfoDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);
}
