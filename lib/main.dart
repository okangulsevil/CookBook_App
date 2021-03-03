import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cookbook_app/theme.dart';
import 'package:cookbook_app/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cook Book App',
      theme: theme(),
      routes: routes,
      initialRoute: "/splash_screen",
    );
  }
}
