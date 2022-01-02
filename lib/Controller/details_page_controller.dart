import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inv_project/Model/food_details.dart';

class DetailPageController extends GetxController with SingleGetTickerProviderMixin{

  dynamic isLoaded = false.obs;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Ingredients'),
    Tab(text: 'Steps'),
    Tab(text: 'Nutrition',),
  ];

  late TabController tabController;
  late FoodDetails foodDetails;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);

  }
  
  getFoodDetails() async {
    var url = Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=52959");
    var response = await http.get(url);
    if(response.statusCode == 200){
      foodDetails = FoodDetails.fromJson(json.decode(response.body));
      if(foodDetails.meals.isNotEmpty){
        isLoaded.value = true;
      }
    }
  }
}