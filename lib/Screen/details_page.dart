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
    if(data == 'Food'){
      controller.getFoodDetails();
    } else {

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
                    image: NetworkImage(controller.foodDetails.meals[0].strMealThumb)
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
                TabBar(
                  padding: EdgeInsets.only(left: 10, right: 10),
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
                SizedBox(height: 20,),
                Expanded(
                  child: Padding(
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
                                Text('2 servings', style: TextStyle(color: Colors.black45),)
                              ],),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: (){},
                                  child: Icon(Icons.add, color: Colors.white, size: 13,),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFE44F53),
                                    shape: CircleBorder(),
                                  ),
                                ),
                                Text('2'),
                                TextButton(
                                  onPressed: (){},
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
                          child: SingleChildScrollView(
                            child: Wrap(
                              children: [
                                ingredientBar(controller.foodDetails.meals[0].strIngredient1, controller.foodDetails.meals[0].strMeasure1),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient2, controller.foodDetails.meals[0].strMeasure2),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient3, controller.foodDetails.meals[0].strMeasure3),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient4, controller.foodDetails.meals[0].strMeasure4),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient5, controller.foodDetails.meals[0].strMeasure5),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient6, controller.foodDetails.meals[0].strMeasure6),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient7, controller.foodDetails.meals[0].strMeasure7),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient8, controller.foodDetails.meals[0].strMeasure8),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient9, controller.foodDetails.meals[0].strMeasure9),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient10, controller.foodDetails.meals[0].strMeasure10),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient11, controller.foodDetails.meals[0].strMeasure11),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient12, controller.foodDetails.meals[0].strMeasure12),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient13, controller.foodDetails.meals[0].strMeasure13),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient14, controller.foodDetails.meals[0].strMeasure14),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient15, controller.foodDetails.meals[0].strMeasure15),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient16, controller.foodDetails.meals[0].strMeasure16),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient17, controller.foodDetails.meals[0].strMeasure17),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient18, controller.foodDetails.meals[0].strMeasure18),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient19, controller.foodDetails.meals[0].strMeasure19),
                                ingredientBar(controller.foodDetails.meals[0].strIngredient20, controller.foodDetails.meals[0].strMeasure20),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
}
