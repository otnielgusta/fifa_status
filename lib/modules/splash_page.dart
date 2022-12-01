import 'package:fifa_status/modules/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  void navegarParaHome(context) async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    navegarParaHome(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.webp'),
          ],
        ),
      ),
    );
  }
}
