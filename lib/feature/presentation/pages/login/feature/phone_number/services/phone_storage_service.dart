import 'package:hive_ce/hive.dart';

abstract class PhoneStorageService {
  void savePhoneNumber(String phoneNumber);
}

class HivePhoneStorageService implements PhoneStorageService {
  @override
  void savePhoneNumber(String phoneNumber) {
    var userBox = Hive.box('userBox');
    userBox.put('phoneNumber', phoneNumber);
  }
}