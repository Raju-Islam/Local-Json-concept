// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:local_json_full_consept/screen/product_detailsScreen.dart';
import 'package:local_json_full_consept/screen/product_listScreen.dart';

// ignore: prefer_const_constructors
void main() => runApp(MaterialApp(
      home: Product_ListScreen(),
      debugShowCheckedModeBanner: false,
     routes: {
       Product_ListScreen.routeName:(context)=>Product_ListScreen(),
       ProductDetailsScreen.routeName:(context)=>ProductDetailsScreen()
     },
    ));

