import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.page.dart';
import 'package:flutter_application_1/account.page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.path,
      routes: {
        HomePage.path: (context) => HomePage(),
        MyAccountPage.path: (context) => MyAccountPage(),
      },
    );
  }
}
