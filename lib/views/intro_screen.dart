import 'package:flutter/material.dart';
import '../utils/services/shared_prefernce.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Firebase Keeper!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                SharedPreferencesHelper.setFirstTime(false);
                Navigator.of(context).pushReplacementNamed('login_page');
              },
              child: Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
