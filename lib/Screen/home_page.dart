import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inv_project/Controller/home_page_controller.dart';
import 'package:inv_project/Model/drinks_categories.dart';
import 'package:inv_project/Model/food_categories.dart';
import 'package:inv_project/Screen/details_page.dart';
import 'package:inv_project/Widget/search_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());
    var data = Get.arguments;
    if (data == 'Food'){
      print('load food');
      controller.getFoodCategories();
    } else if (data == 'Beverages'){
      print('load beverages');
      controller.getBeveragesList();
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Obx(() => controller.isLoaded.value == true ? Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          // leadingWidth: 100,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Good Morning Akila!',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: (){

                },
                icon: const Icon(Icons.shopping_cart, color: Colors.black,))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Delivering to'),
                      DropdownButton<String>(
                        value: 'Current Location',
                        underline: const SizedBox(),
                        icon: const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(Icons.chevron_right, color: Color(0xFFC53707),)),
                        items: <String>['Current Location', 'Office', 'Home', 'Custom Location'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w700),),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      )
                    ],
                  ),
                )),
            searchBar(),
            const SizedBox(height: 20,),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: data == 'Food' ? controller.foodCategories.categories.length : beveragesType.length,
                  itemBuilder: (context, i){
                    return GestureDetector(
                      onTap: () {
                        controller.updateCategory(data == 'Food' ? controller.foodCategories.categories[i].strCategory : beveragesType[i].strSearchDrink);
                        if (data == 'Beverages'){
                          controller.beveragesSelect.value = beveragesType[i].strDrink.toString().split(' ').first;
                        }
                      },
                      child: SizedBox(
                        width: 110,
                        child: Column(children: [
                          Card(
                            child: ClipRRect(
                              child: Image.network(
                                data == 'Food' ? controller.foodCategories.categories[i].strCategoryThumb : beveragesType[i].strDrinkThumb,
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          Text(data == 'Food' ? controller.foodCategories.categories[i].strCategory : beveragesType[i].strDrink, style: TextStyle(fontWeight: FontWeight.bold),)
                        ],),
                      ),
                    );
                  }
              ),
            ),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                      child: Text('Popular $data', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),)),
                  SizedBox(height: 20,),
                  Expanded(
                    child: Obx(() => controller.isSelected.value == true ? ListView.builder(
                      // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: data == 'Food' ? controller.mealsList.meals.length : controller.beveragesList.drinks.length,
                        itemBuilder: (context, i){
                          return GestureDetector(
                            onTap: () => Get.to(() => DetailsPage(), arguments: [data, data == 'Food' ? controller.mealsList.meals[i].idMeal : controller.beveragesList.drinks[i].idDrink]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: 100.w,
                                  child: Image.network(data == 'Food' ? controller.mealsList.meals[i].strMealThumb : controller.beveragesList.drinks[i].strDrinkThumb, fit: BoxFit.cover,),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(data == 'Food' ? controller.mealsList.meals[i].strMeal : controller.beveragesList.drinks[i].strDrink, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Row(children: [
                                    Icon(Iconsax.star1, color: Color(0xFFC53707),),
                                    SizedBox(width: 5,),
                                    Text((Random().nextDouble() * Random().nextInt(5)).toStringAsPrecision(1), style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC53707), fontSize: 12),),
                                    Text(' (${Random().nextInt(2000)} Ratings) Café ', style: TextStyle(fontSize: 12),),
                                    Icon(Icons.circle, size: 5, color: Color(0xFFC53707),),
                                    Text(' ${data == 'Food' ? controller.foodSelect.value : controller.beveragesSelect.value} $data', style: TextStyle(fontSize: 12),)
                                  ],),
                                ),
                                SizedBox(height: 10,)
                              ],),
                          );
                        }
                    ) : Center(child: Lottie.asset('assets/lottie/fnb.json', height: 50))),
                  ),
                ],)
            )
          ],
        ),
      ) : Scaffold(body: Center(child: Lottie.asset('assets/lottie/fnb.json', height: 100)))),
    );
  }
}
