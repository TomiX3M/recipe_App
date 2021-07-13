import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

// ignore: must_be_immutable
class Prep extends StatelessWidget {
  late Recipe prep;

  Prep(this.prep);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(prep.name),

        ),
        body: ListView.builder(
            itemCount: prep.preparationSteps.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Step ' + index.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(prep.preparationSteps[index]),
                    ],
                  ),
                ),
              );
            }));
  }
}
