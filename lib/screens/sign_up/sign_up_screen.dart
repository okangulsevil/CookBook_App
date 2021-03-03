import 'package:flutter/material.dart';
import 'package:cookbook_app/screens/sign_up/components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kayıt Ol"),
      ),
      body: SignUpBody(),
    );
  }
}
