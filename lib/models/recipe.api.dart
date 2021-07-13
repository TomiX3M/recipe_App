import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe.dart';

class RecipeApi {
//  var unirest = require("unirest");
//
//  var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");
//
//  req.query({
//  "start": "0",
//  "limit": "18",
//  "tag": "list.recipe.popular"
//  });
//
//  req.headers({
//  "x-rapidapi-key": "0f36691b97msh65fb4b0fe52708dp1ce9fdjsn7216fcc50abf",
//  "x-rapidapi-host": "yummly2.p.rapidapi.com",
//  "useQueryString": true
//  });
//
//
//  req.end(function (res) {
//    if (res.error) throw new Error(res.error);
//
//    console.log(res.body);
//  });

  Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "0f36691b97msh65fb4b0fe52708dp1ce9fdjsn7216fcc50abf",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    final Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}
