import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inv_project/Model/drink_details.dart';
import 'package:inv_project/Model/food_details.dart';

class DetailPageController extends GetxController with SingleGetTickerProviderMixin{

  dynamic isLoaded = false.obs;
  dynamic servings = 1.obs;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Ingredients'),
    Tab(text: 'Steps'),
    Tab(text: 'Nutrition',),
  ];

  late TabController tabController;
  late FoodDetails foodDetails;
  late DrinkDetails drinkDetails;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);

  }

  addServings(){
    if(servings.value != 0) {
      servings.value += 1;
    }
  }

  minusServings(){
    if(servings.value > 1) {
      servings.value -= 1;
    }
  }

  
  getFoodDetails() async {
    var data = Get.arguments;
    var url = Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=${data[1]}");
    var response = await http.get(url);
    if(response.statusCode == 200){
      foodDetails = FoodDetails.fromJson(json.decode(response.body));
      if(foodDetails.meals.isNotEmpty){
        isLoaded.value = true;
      }
    }
  }
  
  getDrinkDetails() async {
    var data = Get.arguments;
    var url = Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=${data[1]}");
    var response = await http.get(url);
    if(response.statusCode == 200){
      drinkDetails = DrinkDetails.fromJson(json.decode(response.body));
      if(drinkDetails.drinks.isNotEmpty){
        isLoaded.value = true;
      }
    }
  }
}