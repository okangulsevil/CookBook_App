import 'package:flutter/material.dart';
import 'package:cookbook_app/screens/splash/splash_screen.dart';
import 'package:cookbook_app/screens/sign_in/sign_in_screen.dart';
import 'package:cookbook_app/screens/sign_up/sign_up_screen.dart';
import 'package:cookbook_app/screens/home/home_screen.dart';
import 'package:cookbook_app/screens/home_add/home_add_screen.dart';

final routes = {
  "/": (BuildContext context) => HomeScreen(),
  "/splash_screen": (BuildContext context) => SplashScreen(),
  "/sign_in_screen": (BuildContext context) => SignInScreen(),
  "/sign_up_screen": (BuildContext context) => SignUpScreen(),
  "/home_add": (BuildContext context) => HomeAddScreen(),
/*  "/recipes_detail": (BuildContext context) => RecipesDetailScreen(), 
*/
};
