class MealsList {
  MealsList({
    required this.meals,
  });
  late final List<Meals> meals;

  MealsList.fromJson(Map<String, dynamic> json){
    meals = List.from(json['meals']).map((e)=>Meals.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meals'] = meals.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Meals {
  Meals({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });
  late final String strMeal;
  late final String strMealThumb;
  late final String idMeal;

  Meals.fromJson(Map<String, dynamic> json){
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['strMeal'] = strMeal;
    _data['strMealThumb'] = strMealThumb;
    _data['idMeal'] = idMeal;
    return _data;
  }
}