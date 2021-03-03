import 'package:flutter/material.dart';
import 'package:cookbook_app/screens/sign_in/components/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Giriş Yap"),
      ),
      body: SignInBody(),
    );
  }
}
