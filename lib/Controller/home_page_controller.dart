import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inv_project/Model/drinks.dart';
import 'package:inv_project/Model/food_categories.dart';
import 'package:inv_project/Model/meals.dart';

class HomePageController extends GetxController with SingleGetTickerProviderMixin{

  dynamic isLoaded = false.obs;
  dynamic isSelected = false.obs;
  dynamic foodSelect = "Beef".obs;
  dynamic beveragesSelect = "Ordinary".obs;

  late FoodCategories foodCategories;
  late MealsList mealsList;
  late BeveragesList beveragesList;

  getFoodCategories() async {
    var url = Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      foodCategories = FoodCategories.fromJson(json.decode(response.body));
      if(foodCategories.categories.isNotEmpty){
        getFoodList();
      }
    }
  }

  getFoodList() async {
    var url = Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=${foodSelect.value}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      mealsList = MealsList.fromJson(json.decode(response.body));
      if (mealsList.meals.isNotEmpty){
        isLoaded.value = true;
        isSelected.value = true;
      }
    }
  }
  
  getBeveragesList() async {
    var url = Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      beveragesList = BeveragesList.fromJson(json.decode(response.body));
      if(beveragesList.drinks.isNotEmpty){
        isLoaded.value = true;
        isSelected.value = true;
      }
    }
  }

  updateCategory(String category) async {
    print(category);
    isSelected.value = false;

    var data = Get.arguments;
    if (data == 'Food') {
      var url = Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        mealsList = MealsList.fromJson(json.decode(response.body));
        if (mealsList.meals.isNotEmpty) {
          foodSelect.value = category;
          isSelected.value = true;
        }
      }
    } else if (data == 'Beverages') {
      var url = Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$category");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        beveragesList = BeveragesList.fromJson(json.decode(response.body));
        if(beveragesList.drinks.isNotEmpty){
          isSelected.value = true;
        }
      }
    }
  }
}