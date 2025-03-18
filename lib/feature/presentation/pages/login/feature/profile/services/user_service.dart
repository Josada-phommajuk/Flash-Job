import 'package:hive_ce/hive.dart';

class UserService {
  final _userBox = Hive.box('userBox');

  Future<void> saveUserData({
    required String name,
    required String surname,
    String? profileImagePath,
    required Function() onComplete,
  }) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 800));
    
    // Save user data to Hive
    _userBox.put('name', name);
    _userBox.put('surname', surname);

    if (profileImagePath != null) {
      _userBox.put('profileImage', profileImagePath);
    }

    onComplete();
  }
}