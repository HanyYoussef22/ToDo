import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/Layout/HomeLayout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/shard/providers/app_provider.dart';
import 'package:todo/shard/styles/My_Themes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
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
      debugShowMaterialGrid: false,
      locale:  Locale(provider.AppLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.roudeName,
      routes: {
        HomeLayout.roudeName:(context)=>HomeLayout(),
      },
      themeMode:provider.themeMode ,
      theme: MyThemeData.lightTheme,
       darkTheme: MyThemeData.darkTheme,
    );
  }
}
