import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    var userBox = Hive.box('userBox');
    bool isFirstTime = userBox.get('isFirstTime', defaultValue: true);

    // ກວດສອບວ່າເຄີຍລັອກອິນແລ້ວບໍ່ ຖ້າເຄີຍໃຫ້ໄປຫນ້າ homepage ຖ້າຍັງກະໄປລັອກອິນກ່ອນຢ່າຂີ້ຄ້ານ

    if (isFirstTime) {
      context.go('/getstart');
    } else {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF0C320),
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
