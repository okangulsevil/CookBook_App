import 'package:cookbook_app/screens/home/components/recipes_list.dart';
import 'package:flutter/material.dart';
import 'package:cookbook_app/screens/home/components/header_with_searchbox.dart';

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWithSearchBox(),
        RecipesList(),
      ],
    );
  }
}
