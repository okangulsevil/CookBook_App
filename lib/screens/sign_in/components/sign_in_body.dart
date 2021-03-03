import 'package:flutter/material.dart';
import 'package:cookbook_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cookbook_app/screens/sign_in/components/sign_in_form.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Tekrar Hoşgeldiniz",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "E-posta ve şifre ile giriş yapın  \nya da sosyal medya hesabınızla devam edin",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              // GİRİŞ YAP FORMU
              SignInForm(),
              //
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(60),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/google-plus.svg"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(60),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/facebook.svg"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(60),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/twitter.svg"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              //
              //
              //NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
