import 'package:freezed_annotation/freezed_annotation.dart';
part 'model_class_freezed.freezed.dart';

@freezed
class Temperatures with _$Temperatures {
  const factory Temperatures({
    required int id,
    required String name,
    required String username,
    required String email,
    required Address address,
    required String phone,
    required String website,
    required Company company,
  }) = _Temperatures;

  factory Temperatures.fromJson(Map<String, dynamic> json) =>
      _$TemperaturesFromJson(
          json); // Add this constructor for JSON deserialization
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required Geo geo,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json); // Add this constructor for JSON deserialization
}

@freezed
abstract class Geo with _$Geo {
  const factory Geo({
    required String lat,
    required String lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) =>
      _$GeoFromJson(json); // Add this constructor for JSON deserialization
}

@freezed
abstract class Company with _$Company {
  const factory Company({
    required String name,
    required String catchPhrase,
    required String bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json); // Add this constructor for JSON deserialization
}
