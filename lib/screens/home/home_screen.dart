import 'package:cookbook_app/constants.dart';
import 'package:cookbook_app/screens/home/components/recipes_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:cookbook_app/screens/home/components/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        // On Android by default its false
        centerTitle: true,
        // title: Image.asset("assets/images/logo.png"),
      ),
      body: RecipesList(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () => Navigator.pushNamed(context, "/home_add"),
        label: Text("Tarif Ekle"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
