import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.api.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/views/Steps.dart';
import 'package:recipe_app/widgets//recipe_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Recipe> _recipe;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future getRecipes() async {
    _recipe = await RecipeApi().getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 20,
              ),
              Text('Food Recipe'),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipe.length,
                itemBuilder: (BuildContext context, int position) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Prep(_recipe[position]))),
                    child: RecipeCard(
                        title: _recipe[position].name,
                        cookTime: _recipe[position].totalTime,
                        rating: _recipe[position].rating.toString(),
                        thumbnailUrl: _recipe[position].images),
                  );
                }));
  }
}
