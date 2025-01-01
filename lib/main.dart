import 'package:book_management/utils/services/shared_prefernce.dart';
import 'package:book_management/views/homepage.dart';
import 'package:book_management/views/intro_screen.dart';
import 'package:book_management/views/login_screen.dart';
import 'package:book_management/views/splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'home_page': (context) => HomePage(),
        'intro_screen': (context) => IntroScreen(),
        'login_page': (context) => LoginScreen(),
      },
    );
  }
}
