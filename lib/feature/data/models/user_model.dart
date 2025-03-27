import 'package:hive_ce/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? surname;

  @HiveField(2)
  String? profileImage;

  @HiveField(3)
  String? phoneNumber;

  @HiveField(4)
  String? address;

  @HiveField(5)
  String? district;

  @HiveField(6)
  String? province;

  @HiveField(7)
  String? country;

  @HiveField(8)
  String? countryCode;

  UserModel({
    this.name,
    this.surname,
    this.profileImage,
    this.phoneNumber,
    this.address,
    this.district,
    this.province,
    this.country,
    this.countryCode,
  });
}

// Country model to support country selection
@HiveType(typeId: 1)
class CountryModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String code;

  @HiveField(2)
  final String dialCode;

  CountryModel({
    required this.name,
    required this.code,
    required this.dialCode,
  });

  // List of predefined countries
  static List<CountryModel> countries = [
    CountryModel(name: 'Thailand', code: 'TH', dialCode: '+66'),
    CountryModel(name: 'Laos', code: 'LA', dialCode: '+856'),
    CountryModel(name: 'Vietnam', code: 'VN', dialCode: '+84'),
    CountryModel(name: 'Cambodia', code: 'KH', dialCode: '+855'),
    CountryModel(name: 'Myanmar', code: 'MM', dialCode: '+95'),
  ];

  // Helper method to get country by dial code
  static CountryModel? getCountryByDialCode(String dialCode) {
    return countries.firstWhere(
      (country) => country.dialCode == dialCode,
      orElse: () => countries[1], // Default to Laos if not found
    );
  }
}