class FoodDetails {
  FoodDetails({
    required this.meals,
  });
  late final List<Meals> meals;

  FoodDetails.fromJson(Map<String, dynamic> json){
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
    required this.idMeal,
    required this.strMeal,
    this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
    required this.strIngredient18,
    required this.strIngredient19,
    required this.strIngredient20,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strMeasure16,
    required this.strMeasure17,
    required this.strMeasure18,
    required this.strMeasure19,
    required this.strMeasure20,
    required this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });
  late final String idMeal;
  late final String strMeal;
  late final Null strDrinkAlternate;
  late final String strCategory;
  late final String strArea;
  late final String strInstructions;
  late final String strMealThumb;
  late final String strTags;
  late final String strYoutube;
  late final String strIngredient1;
  late final String strIngredient2;
  late final String strIngredient3;
  late final String strIngredient4;
  late final String strIngredient5;
  late final String strIngredient6;
  late final String strIngredient7;
  late final String strIngredient8;
  late final String strIngredient9;
  late final String strIngredient10;
  late final String strIngredient11;
  late final String strIngredient12;
  late final String strIngredient13;
  late final String strIngredient14;
  late final String strIngredient15;
  late final String strIngredient16;
  late final String strIngredient17;
  late final String strIngredient18;
  late final String strIngredient19;
  late final String strIngredient20;
  late final String strMeasure1;
  late final String strMeasure2;
  late final String strMeasure3;
  late final String strMeasure4;
  late final String strMeasure5;
  late final String strMeasure6;
  late final String strMeasure7;
  late final String strMeasure8;
  late final String strMeasure9;
  late final String strMeasure10;
  late final String strMeasure11;
  late final String strMeasure12;
  late final String strMeasure13;
  late final String strMeasure14;
  late final String strMeasure15;
  late final String strMeasure16;
  late final String strMeasure17;
  late final String strMeasure18;
  late final String strMeasure19;
  late final String strMeasure20;
  late final String strSource;
  late final Null strImageSource;
  late final Null strCreativeCommonsConfirmed;
  late final Null dateModified;

  Meals.fromJson(Map<String, dynamic> json){
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strDrinkAlternate = null;
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strTags = json['strTags'];
    strYoutube = json['strYoutube'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = json['strIngredient4'];
    strIngredient5 = json['strIngredient5'];
    strIngredient6 = json['strIngredient6'];
    strIngredient7 = json['strIngredient7'];
    strIngredient8 = json['strIngredient8'];
    strIngredient9 = json['strIngredient9'];
    strIngredient10 = json['strIngredient10'];
    strIngredient11 = json['strIngredient11'];
    strIngredient12 = json['strIngredient12'];
    strIngredient13 = json['strIngredient13'];
    strIngredient14 = json['strIngredient14'];
    strIngredient15 = json['strIngredient15'];
    strIngredient16 = json['strIngredient16'];
    strIngredient17 = json['strIngredient17'];
    strIngredient18 = json['strIngredient18'];
    strIngredient19 = json['strIngredient19'];
    strIngredient20 = json['strIngredient20'];
    strMeasure1 = json['strMeasure1'];
    strMeasure2 = json['strMeasure2'];
    strMeasure3 = json['strMeasure3'];
    strMeasure4 = json['strMeasure4'];
    strMeasure5 = json['strMeasure5'];
    strMeasure6 = json['strMeasure6'];
    strMeasure7 = json['strMeasure7'];
    strMeasure8 = json['strMeasure8'];
    strMeasure9 = json['strMeasure9'];
    strMeasure10 = json['strMeasure10'];
    strMeasure11 = json['strMeasure11'];
    strMeasure12 = json['strMeasure12'];
    strMeasure13 = json['strMeasure13'];
    strMeasure14 = json['strMeasure14'];
    strMeasure15 = json['strMeasure15'];
    strMeasure16 = json['strMeasure16'];
    strMeasure17 = json['strMeasure17'];
    strMeasure18 = json['strMeasure18'];
    strMeasure19 = json['strMeasure19'];
    strMeasure20 = json['strMeasure20'];
    strSource = json['strSource'];
    strImageSource = null;
    strCreativeCommonsConfirmed = null;
    dateModified = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idMeal'] = idMeal;
    _data['strMeal'] = strMeal;
    _data['strDrinkAlternate'] = strDrinkAlternate;
    _data['strCategory'] = strCategory;
    _data['strArea'] = strArea;
    _data['strInstructions'] = strInstructions;
    _data['strMealThumb'] = strMealThumb;
    _data['strTags'] = strTags;
    _data['strYoutube'] = strYoutube;
    _data['strIngredient1'] = strIngredient1;
    _data['strIngredient2'] = strIngredient2;
    _data['strIngredient3'] = strIngredient3;
    _data['strIngredient4'] = strIngredient4;
    _data['strIngredient5'] = strIngredient5;
    _data['strIngredient6'] = strIngredient6;
    _data['strIngredient7'] = strIngredient7;
    _data['strIngredient8'] = strIngredient8;
    _data['strIngredient9'] = strIngredient9;
    _data['strIngredient10'] = strIngredient10;
    _data['strIngredient11'] = strIngredient11;
    _data['strIngredient12'] = strIngredient12;
    _data['strIngredient13'] = strIngredient13;
    _data['strIngredient14'] = strIngredient14;
    _data['strIngredient15'] = strIngredient15;
    _data['strIngredient16'] = strIngredient16;
    _data['strIngredient17'] = strIngredient17;
    _data['strIngredient18'] = strIngredient18;
    _data['strIngredient19'] = strIngredient19;
    _data['strIngredient20'] = strIngredient20;
    _data['strMeasure1'] = strMeasure1;
    _data['strMeasure2'] = strMeasure2;
    _data['strMeasure3'] = strMeasure3;
    _data['strMeasure4'] = strMeasure4;
    _data['strMeasure5'] = strMeasure5;
    _data['strMeasure6'] = strMeasure6;
    _data['strMeasure7'] = strMeasure7;
    _data['strMeasure8'] = strMeasure8;
    _data['strMeasure9'] = strMeasure9;
    _data['strMeasure10'] = strMeasure10;
    _data['strMeasure11'] = strMeasure11;
    _data['strMeasure12'] = strMeasure12;
    _data['strMeasure13'] = strMeasure13;
    _data['strMeasure14'] = strMeasure14;
    _data['strMeasure15'] = strMeasure15;
    _data['strMeasure16'] = strMeasure16;
    _data['strMeasure17'] = strMeasure17;
    _data['strMeasure18'] = strMeasure18;
    _data['strMeasure19'] = strMeasure19;
    _data['strMeasure20'] = strMeasure20;
    _data['strSource'] = strSource;
    _data['strImageSource'] = strImageSource;
    _data['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    _data['dateModified'] = dateModified;
    return _data;
  }
}