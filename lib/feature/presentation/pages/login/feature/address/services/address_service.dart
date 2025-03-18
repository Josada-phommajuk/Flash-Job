import 'package:hive_ce/hive.dart';

class AddressService {
  final _userBox = Hive.box('userBox');

  void saveAddress({
    required String address,
    required String district,
    required String province,
    required Function onComplete,
  }) {
    Future.delayed(Duration(milliseconds: 800), () {
      _userBox.put('address', address);
      _userBox.put('district', district);
      _userBox.put('province', province);
      onComplete();
    });
  }
}