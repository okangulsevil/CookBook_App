import 'package:cookbook_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeAddScreen extends StatefulWidget {
  @override
  _HomeAddScreenState createState() => _HomeAddScreenState();
}

class _HomeAddScreenState extends State<HomeAddScreen> {
  final _formKey = GlobalKey<FormState>();
  var txtTitle = TextEditingController();
  var txtMaterials = TextEditingController();
  var txtDescription = TextEditingController();
  String recipeTitle;
  String recipeMaterials;
  String recipeDescription;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // On Android by default its false
        centerTitle: true,
        title: Text(
          "Tarif Ekle",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTitleField(),
                    buildMaterialsField(),
                    buildDescriptionField(),
                    buildSaveButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTitleField() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFFF1E6FF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        style: TextStyle(fontSize: 20),
        controller: txtTitle,
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) return "Başlık gerekli";
        },
        onSaved: (value) {
          recipeTitle = value;
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: "Tarif Başlığı",
          border: InputBorder.none,
        ),
      ),
    );
  }

  buildMaterialsField() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFFF1E6FF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        style: TextStyle(fontSize: 20),
        controller: txtMaterials,
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) return "Malzemeler gerekli";
        },
        onSaved: (value) {
          recipeMaterials = value;
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: "Tarif Malzemeleri",
          border: InputBorder.none,
        ),
      ),
    );
  }

  buildDescriptionField() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFFF1E6FF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        style: TextStyle(fontSize: 20),
        controller: txtDescription,
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) return "Yapılışı gerekli";
        },
        onSaved: (value) {
          recipeDescription = value;
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: "Tarif Yapılışı",
          border: InputBorder.none,
        ),
      ),
    );
  }

  buildSaveButton() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: kPrimaryColor,
          onPressed: () => RecipeAdd(),
          child: Text(
            "Tarif Ekle",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  RecipeAdd() {
    FirebaseFirestore.instance.collection("Recipes").doc().set({
      "kullaniciid": auth.currentUser.uid,
      "recipesTitle": txtTitle.text,
      "recipesMaterials": txtMaterials.text,
      "recipesDescription": txtDescription.text,
      "recipesAddDate": DateTime.now(),
    }).whenComplete(() => Navigator.pop(context));
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
