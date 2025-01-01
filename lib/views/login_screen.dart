import 'package:flutter/material.dart';
import '../utils/services/shared_prefernce.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Login Screen"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSBebYiqwAKAx1ybnNk2H0ExmVq5zjkC5O9g&s",
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                SharedPreferencesHelper.setLoggedIn(true);
                Navigator.of(context).pushReplacementNamed('home_page');
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
