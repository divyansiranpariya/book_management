import 'package:flutter/material.dart';
import '../utils/services/shared_prefernce.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await SharedPreferencesHelper.init();
    Future.delayed(Duration(seconds: 2), () {
      bool isFirstTime = SharedPreferencesHelper.getFirstTime();
      bool isLoggedIn = SharedPreferencesHelper.getLoggedIn();

      if (isFirstTime) {
        Navigator.of(context).pushReplacementNamed('intro_screen');
      } else if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed('home_page');
      } else {
        Navigator.of(context).pushReplacementNamed('login_page');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
            fit: BoxFit.cover,
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPxwSxfZ6mklarM631IOv6jlCwxAfGvX2ZBw&s"),
      ),
    );
  }
}
