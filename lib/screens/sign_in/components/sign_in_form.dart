import 'package:cookbook_app/constants.dart';
import 'package:cookbook_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController txtMail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  String eMail;
  String password;

  Future<void> userLogin() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: txtMail.text, password: txtPassword.text)
        .then((user) {
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    }).whenComplete(() => print("Giriş Yapıldı"));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF1E6FF),
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              cursorColor: Color(0xFF6F35A5),
              style: TextStyle(fontSize: 20),
              controller: txtMail,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) return "E-Mail required";
              },
              onSaved: (value) {
                eMail = value;
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color(0xFF6F35A5),
                ),
                hintText: "E-Posta Adresi",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF1E6FF),
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              style: TextStyle(fontSize: 20),
              controller: txtPassword,
              obscureText: true,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) return "Password required";
              },
              onSaved: (value) {
                password = value;
              },
              cursorColor: Color(0xFF6F35A5),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: Color(0xFF6F35A5),
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: Color(0xFF6F35A5),
                ),
                hintText: "min. 6 karakterden oluşan şifrenizi giriniz.",
                hintStyle: TextStyle(
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(80),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: kPrimaryColor,
              onPressed: () => userLogin(),
              child: Text(
                "Giriş Yap",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hala üye olmadın mı ? ",
                style: TextStyle(color: Color(0xFF6F35A5)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/sign_up_screen");
                },
                child: Text(
                  "Kayıt Ol",
                  style: TextStyle(
                    color: Color(0xFF6F35A5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
