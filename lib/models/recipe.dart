class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final List preparationSteps;

  Recipe(
      {required this.name, required this.images, required this.rating, required this.totalTime,required this.preparationSteps});

  factory Recipe.fromJson(Map<String,dynamic> json) {
    return Recipe(
        name: json['details']['name'] as String,
        images: json['details']['images'][0]['hostedLargeUrl'] as String,
        rating: json['details']['rating'] as double,
        totalTime: json['details']['totalTime'] as String,
        preparationSteps: json['preparationSteps'] as List


    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();

  }

//  @override
//  String toString(){
//    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
//  }
}
