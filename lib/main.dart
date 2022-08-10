import 'package:flutter/material.dart';
import 'package:todo/Layout/HomeLayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.roudeName,
      routes: {
        HomeLayout.roudeName:(context)=>HomeLayout(),
      },
      themeMode:ThemeMode.light ,
      // theme: ,
      // darkTheme: ,
    );
  }
}
