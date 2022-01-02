class FoodCategories {
  FoodCategories({
    required this.categories,
  });
  late final List<Categories> categories;

  FoodCategories.fromJson(Map<String, dynamic> json){
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });
  late final String idCategory;
  late final String strCategory;
  late final String strCategoryThumb;
  late final String strCategoryDescription;

  Categories.fromJson(Map<String, dynamic> json){
    idCategory = json['idCategory'];
    strCategory = json['strCategory'];
    strCategoryThumb = json['strCategoryThumb'];
    strCategoryDescription = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idCategory'] = idCategory;
    _data['strCategory'] = strCategory;
    _data['strCategoryThumb'] = strCategoryThumb;
    _data['strCategoryDescription'] = strCategoryDescription;
    return _data;
  }
}