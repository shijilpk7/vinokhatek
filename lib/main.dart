import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/models/services/common_data_provider.dart';
import 'package:vinokhatek/models/services/firebase_services.dart';
import 'package:vinokhatek/routes.dart';
import 'package:vinokhatek/screens/profile/profile_screen.dart';
import 'package:vinokhatek/screens/splash/splash_screen.dart';
import 'package:vinokhatek/theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
    await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
         ChangeNotifierProvider(create: (_) => CommonDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
