import 'package:flutter/material.dart';
import 'package:inv_project/Controller/details_page_controller.dart';
import 'package:inv_project/Model/food_details.dart';

Widget ingredientBar(
    String ingredient,
    String measurement,
    ) {
  return ingredient == "" ? SizedBox() :
  Column(children: [
    Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.all(Radius.circular(7))
          ),
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ingredient, style: TextStyle(color: Colors.black),),
            Text(measurement, style: TextStyle(color: Colors.black45),)
          ],),
      ],),
    Divider()
  ],);
}
