import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inv_project/Screen/home_page.dart';

Widget menuType(String type, String count, String image) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    // width: 100,
    height: 90,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    child: Card(
                      elevation: 5,
                      color: Colors.transparent,
                      shadowColor: Colors.black45,
                      child: Container(
                        // width: 75.w,
                          padding: const EdgeInsets.only(left: 40, top: 20,bottom: 20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(type, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              Text('$count items', style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w200),)
                            ],
                          )
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                  ),
                ),
              ],),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Card(
              elevation: 8,
              shape: CircleBorder(),
              child: ClipOval(child: Image.asset(image,height: 60,), ))),
        Align(
          alignment: Alignment.centerRight,
          child: Card(
            elevation: 4,
            shape: const CircleBorder(),
            child: IconButton(
              onPressed: (){
                Get.to(() => HomePage(), arguments: type);
              },
              icon: const Icon(Icons.chevron_right, color: Color(0xFFC53707),
              ),
            ),
          ),
        )
      ],),
  );
}