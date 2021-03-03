import 'package:cloud_firestore/cloud_firestore.dart';

class Recipes {
  final String recipesTitle;
  final String recipesMaterials;
  final String recipesDescription;
  final DocumentReference reference;

  Recipes.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["recipesTitle"] != null),
        assert(map["recipesMaterials"] != null),
        assert(map["recipesDescription"] != null),
        recipesTitle = map["recipesTitle"],
        recipesMaterials = map["recipesMaterials"],
        recipesDescription = map["recipesDescription"];

  Recipes.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
