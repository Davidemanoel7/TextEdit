import 'package:flutter/material.dart';
import 'package:textedit/screens/login/login_view.dart';
import 'package:textedit/utils/themes.dart';

void main() => runApp(MainApp());


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [MyColors.pBlue, MyColors.pBlueLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: const LoginView(),
        ),
      )
    );
  }
}