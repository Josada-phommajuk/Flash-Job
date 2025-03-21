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
  
// ສຳລັບທີ່ຢູ່
  @HiveField(4)
  String? address;
  
  @HiveField(5)
  String? district;
  
  @HiveField(6)
  String? province;

  UserModel({
    this.name,
    this.surname,
    this.profileImage,
    this.phoneNumber,
    this.address,
    this.district,
    this.province,
  });
}