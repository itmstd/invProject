import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inv_project/Widget/menu_type.dart';
import 'package:sizer/sizer.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            leadingWidth: 80,
            leading: const Align(
              alignment: Alignment.center,
              child: Text('Menu',
                style: TextStyle(color: Colors.black, fontSize: 18), textAlign: TextAlign.center,),
            ),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Iconsax.shopping_cart, color: Colors.black,))
            ],
          ),
          body: Column(
            children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 100.w,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search food",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              flex: 12,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      width: 100,
                      // height: 70.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC53707),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))
                      ),
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ListView(
                        children: [
                          menuType("Food", Random().nextInt(500).toString(), 'assets/food.jpg'),
                          SizedBox(height: 15,),
                          menuType("Beverages", Random().nextInt(500).toString(), 'assets/beverages.jpg'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],)

        ));
  }
}
