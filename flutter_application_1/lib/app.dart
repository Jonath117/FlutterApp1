import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/pages/home.page.dart';
import 'package:flutter_application_1/features/account/presentation/pages/account.page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.path,

      theme: ThemeData(fontFamily: 'Mifuente'),

      routes: {
        HomePage.path: (context) => HomePage(),
        MyAccountPage.path: (context) => MyAccountPage(),
      },
    );
  }
}
