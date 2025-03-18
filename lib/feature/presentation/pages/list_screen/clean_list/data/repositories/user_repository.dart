import 'package:flash_job/feature/data/models/user_model.dart';
import 'package:hive_ce/hive.dart';

class UserRepository {
  // Get user data from Hive
  UserModel getUserData() {
    try {
      var userBox = Hive.box('userBox');
      
      return UserModel(
        name: userBox.get('name') ?? 'ບໍ່ລະບຸ',
        surname: userBox.get('surname') ?? '',
        phoneNumber: userBox.get('phoneNumber') ?? 'ບໍ່ລະບຸ',
        profileImage: userBox.get('profileImage'),
        address: userBox.get('address') ?? 'ບໍ່ລະບຸ',
        district: userBox.get('district') ?? 'ບໍ່ລະບຸ',
        province: userBox.get('province') ?? 'ບໍ່ລະບຸ',
      );
    } catch (e) {
      print('Error loading user data: $e');
      // Return default user model with placeholder values
      return UserModel(
        name: 'ບໍ່ລະບຸ',
        surname: '',
        phoneNumber: 'ບໍ່ລະບຸ',
        address: 'ບໍ່ລະບຸ',
        district: 'ບໍ່ລະບຸ',
        province: 'ບໍ່ລະບຸ',
      );
    }
  }

  // Save user data to Hive (for potential future use)
  Future<void> saveUserData(UserModel user) async {
    try {
      var userBox = Hive.box('userBox');
      await userBox.put('name', user.name);
      await userBox.put('surname', user.surname);
      await userBox.put('phoneNumber', user.phoneNumber);
      await userBox.put('profileImage', user.profileImage);
      await userBox.put('address', user.address);
      await userBox.put('district', user.district);
      await userBox.put('province', user.province);
    } catch (e) {
      print('Error saving user data: $e');
      throw Exception('Failed to save user data');
    }
  }
}