import 'package:flutter/material.dart';
import 'package:todo/Layout/HomeLayout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
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
