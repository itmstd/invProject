import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget searchBar() {
  return SizedBox(
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
  );
}