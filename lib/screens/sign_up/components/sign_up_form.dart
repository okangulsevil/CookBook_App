import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbook_app/constants.dart';
import 'package:cookbook_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtMail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  String firstName;
  String lastName;
  String eMail;
  String password;

  Future<void> userRegister() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (_formKey.currentState.validate()) {
      try {
        _formKey.currentState.save();
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: txtMail.text, password: txtPassword.text)
            .then((user) {
          FirebaseFirestore.instance
              .collection("Users")
              .doc(auth.currentUser.uid)
              .set({
            "UserId": auth.currentUser.uid,
            "UserFirstName": txtFirstName.text,
            "UserLastName": txtLastName.text,
            "UserMail": txtMail.text,
            "UserPassword": txtPassword.text,
            "UserRegisterDate": DateTime.now(),
          }).then((user) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/sign_in_screen", (route) => false);
          });
        });
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xFFF1E6FF),
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              cursorColor: Color(0xFF6F35A5),
              style: TextStyle(fontSize: 20),
              controller: txtFirstName,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) return "İsim yazmanız gerekli";
              },
              onSaved: (value) {
                firstName = value;
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color(0xFF6F35A5),
                ),
                hintText: "İsminiz",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xFFF1E6FF),
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              cursorColor: Color(0xFF6F35A5),
              style: TextStyle(fontSize: 20),
              controller: txtLastName,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) return "Soy isim yazmanız gerekli";
              },
              onSaved: (value) {
                lastName = value;
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color(0xFF6F35A5),
                ),
                hintText: "Soy isminiz",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
              onPressed: () => userRegister(),
              child: Text(
                "Kayıt Ol",
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
                "Zaten hesabınız var mı ? ",
                style: TextStyle(color: Color(0xFF6F35A5)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/sign_in_screen", (route) => false);
                },
                child: Text(
                  "Giriş Yap",
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
