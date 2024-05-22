class Recipe {
  String name;
  List<RecipeStep> steps;

  Recipe({required this.name, required this.steps});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var stepsList = json['steps'] as List;
    List<RecipeStep> steps = stepsList.map((step) => RecipeStep.fromJson(step)).toList();

    return Recipe(
      name: json['name'],
      steps: steps,
    );
  }
}

class RecipeStep {
  int number;
  String step;
  List<Ingredient> ingredients;
  List<Equipment> equipment;
  Length length;

  RecipeStep({required this.number,required this.step,required this.ingredients,required this.equipment,required this.length});

  factory RecipeStep.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Null JSON provided for RecipeStep');
    }

    var ingredientsList = json['ingredients'] as List<dynamic>? ?? [];
    List<Ingredient> ingredients = ingredientsList.map((ingredient) => Ingredient.fromJson(ingredient)).toList();

    var equipmentList = json['equipment'] as List<dynamic>? ?? [];
    List<Equipment> equipment = equipmentList.map((equipment) => Equipment.fromJson(equipment)).toList();

    var lengthJson = json['length'] as Map<String, dynamic>? ?? {'number': 0, 'unit': ''};
    Length length = Length.fromJson(lengthJson);

    return RecipeStep(
      number: json['number'] ?? 0,
      step: json['step'] ?? '',
      ingredients: ingredients,
      equipment: equipment,
      length: length,
    );
  }

}

class Ingredient {
  int id;
  String name;
  String localizedName;
  String image;

  Ingredient({required this.id,required this.name,required this.localizedName,required this.image});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      localizedName: json['localizedName'],
      image: json['image'],
    );
  }
}

class Equipment {
  int id;
  String name;
  String localizedName;
  String image;

  Equipment({required this.id,required this.name,required this.localizedName,required this.image});

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['id'],
      name: json['name'],
      localizedName: json['localizedName'],
      image: json['image'],
    );
  }
}

class Length {
  int number;
  String unit;

  Length({required this.number,required this.unit});

  factory Length.fromJson(Map<String, dynamic> json) {
    return Length(
      number: json['number'],
      unit: json['unit'],
    );
  }
}
