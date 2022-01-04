import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inv_project/Controller/details_page_controller.dart';
import 'package:inv_project/Widget/ingredient.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailPageController controller = Get.put(DetailPageController());
    var data = Get.arguments;
    if(data[0] == 'Food'){
      print(data[1]);
      controller.getFoodDetails();
    } else {
      print(data[1]);
      controller.getDrinkDetails();
    }

    return Obx(() => controller.isLoaded.value == true ? Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: 100.w,
            height: 40.h,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 10),
                  child: Row(children: [
                    Icon(Iconsax.star1, color: Colors.black,),
                    SizedBox(width: 5,),
                    Text((Random().nextDouble() * Random().nextInt(5)).toStringAsPrecision(1) + " ", style: TextStyle(color: Colors.black45, fontSize: 12),),
                    Icon(Icons.circle, size: 5, color: Colors.grey.shade400,),
                    Text(' 15:06', style: TextStyle(fontSize: 12, color: Colors.black45),)
                  ],),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 150),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.play_arrow_rounded),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFE44F53),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data[0] == 'Food' ? controller.foodDetails.meals[0].strMealThumb : controller.drinkDetails.drinks[0].strDrinkThumb ?? "")
                )
              // color: Colors.yellow
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 36.h),
            width: 100.w,
            child: Column(
              children: [
                Row(children: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Iconsax.message)
                  ),
                  Expanded(flex: 3,child: Text(Random().nextInt(500).toString())),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Iconsax.star)
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Iconsax.save_2)
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Iconsax.share)
                  ),
                ],),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    shadowColor: Colors.grey.shade200,
                    elevation: 2,
                    child: TabBar(
                      // padding: EdgeInsets.only(left: 10, right: 10),
                      controller: controller.tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          7.0,
                        ),
                        color: Color(0xFFE44F53),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black45,
                      tabs: controller.myTabs,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: [
                      ingredientTab(controller),
                      stepsTab(controller),
                      nutritionTab(controller)
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
            ),
          )
        ],
      ),
    ) : Scaffold(body: Center(child: Lottie.asset('assets/lottie/fnb.json', height: 100))));
  }

  ingredientTab(DetailPageController controller){
    var data = Get.arguments;
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ingredients For', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${controller.servings} servings', style: TextStyle(color: Colors.black45),)
                ],),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){controller.addServings();},
                    child: Icon(Icons.add, color: Colors.white, size: 13,),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFE44F53),
                      shape: CircleBorder(),
                    ),
                  ),
                  Text(controller.servings.toString()),
                  TextButton(
                    onPressed: (){controller.minusServings();},
                    child: Icon(Icons.remove, color: Colors.white, size: 13,),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFE44F53),
                      shape: CircleBorder(),
                    ),
                    // color: Color(0xFFE44F53),
                  )
                ],
              ),
            ],
          ),
          Divider(color: Colors.black38,),
          Expanded(
            child: data[0] == 'Food' ? mealIngredientList(controller) : drinkIngredientList(controller)
            // SingleChildScrollView(
            //   child: Wrap(
            //     children: [
            //       //Food details
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient1, controller.foodDetails.meals[0].strMeasure1, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient2, controller.foodDetails.meals[0].strMeasure2, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient3, controller.foodDetails.meals[0].strMeasure3, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient4, controller.foodDetails.meals[0].strMeasure4, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient5, controller.foodDetails.meals[0].strMeasure5, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient6, controller.foodDetails.meals[0].strMeasure6, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient7, controller.foodDetails.meals[0].strMeasure7, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient8, controller.foodDetails.meals[0].strMeasure8, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient9, controller.foodDetails.meals[0].strMeasure9, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient10, controller.foodDetails.meals[0].strMeasure10, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient11, controller.foodDetails.meals[0].strMeasure11, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient12, controller.foodDetails.meals[0].strMeasure12, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient13, controller.foodDetails.meals[0].strMeasure13, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient14, controller.foodDetails.meals[0].strMeasure14, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient15, controller.foodDetails.meals[0].strMeasure15, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient16, controller.foodDetails.meals[0].strMeasure16, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient17, controller.foodDetails.meals[0].strMeasure17, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient18, controller.foodDetails.meals[0].strMeasure18, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient19, controller.foodDetails.meals[0].strMeasure19, controller),
            //       ingredientBar(controller.foodDetails.meals[0].strIngredient20, controller.foodDetails.meals[0].strMeasure20, controller),
            //     ],
            //   ),
            // ),
          )
        ],
      ),
    );
  }

  Widget mealIngredientList(DetailPageController controller) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          //Food details
          ingredientBar(controller.foodDetails.meals[0].strIngredient1, controller.foodDetails.meals[0].strMeasure1, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient2, controller.foodDetails.meals[0].strMeasure2, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient3, controller.foodDetails.meals[0].strMeasure3, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient4, controller.foodDetails.meals[0].strMeasure4, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient5, controller.foodDetails.meals[0].strMeasure5, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient6, controller.foodDetails.meals[0].strMeasure6, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient7, controller.foodDetails.meals[0].strMeasure7, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient8, controller.foodDetails.meals[0].strMeasure8, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient9, controller.foodDetails.meals[0].strMeasure9, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient10, controller.foodDetails.meals[0].strMeasure10, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient11, controller.foodDetails.meals[0].strMeasure11, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient12, controller.foodDetails.meals[0].strMeasure12, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient13, controller.foodDetails.meals[0].strMeasure13, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient14, controller.foodDetails.meals[0].strMeasure14, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient15, controller.foodDetails.meals[0].strMeasure15, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient16, controller.foodDetails.meals[0].strMeasure16, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient17, controller.foodDetails.meals[0].strMeasure17, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient18, controller.foodDetails.meals[0].strMeasure18, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient19, controller.foodDetails.meals[0].strMeasure19, controller),
          ingredientBar(controller.foodDetails.meals[0].strIngredient20, controller.foodDetails.meals[0].strMeasure20, controller),
        ],
      ),
    );
  }

  Widget drinkIngredientList(DetailPageController controller) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          //Food details
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient1 ?? "", controller.drinkDetails.drinks[0].strMeasure1 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient2 ?? "", controller.drinkDetails.drinks[0].strMeasure2 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient3 ?? "", controller.drinkDetails.drinks[0].strMeasure3 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient4 ?? "", controller.drinkDetails.drinks[0].strMeasure4 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient5 ?? "", controller.drinkDetails.drinks[0].strMeasure5 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient6 ?? "", controller.drinkDetails.drinks[0].strMeasure6 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient7 ?? "", controller.drinkDetails.drinks[0].strMeasure7 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient8 ?? "", controller.drinkDetails.drinks[0].strMeasure8 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient9 ?? "", controller.drinkDetails.drinks[0].strMeasure9 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient10 ?? "", controller.drinkDetails.drinks[0].strMeasure10 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient11 ?? "", controller.drinkDetails.drinks[0].strMeasure11 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient12 ?? "", controller.drinkDetails.drinks[0].strMeasure12 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient13 ?? "", controller.drinkDetails.drinks[0].strMeasure13 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient14 ?? "", controller.drinkDetails.drinks[0].strMeasure14 ?? "", controller),
          ingredientBar(controller.drinkDetails.drinks[0].strIngredient15 ?? "", controller.drinkDetails.drinks[0].strMeasure15 ?? "", controller),
        ],
      ),
    );
  }

  stepsTab(DetailPageController controller){
    var data = Get.arguments;
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(child: Text(data == 'Food' ? controller.foodDetails.meals[0].strInstructions : controller.drinkDetails.drinks[0].strInstructions ?? "No instruction")),
    );
  }

  nutritionTab(DetailPageController controller){
    return Center(
      child: Text('To be added'),
    );
  }
}
