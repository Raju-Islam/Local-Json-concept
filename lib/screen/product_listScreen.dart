// ignore_for_file: file_names, prefer_const_constructors, avoid_print, camel_case_types, avoid_unnecessary_containers, unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_json_full_consept/model/product.dart';
import 'package:local_json_full_consept/screen/product_detailsScreen.dart';

class Product_ListScreen extends StatefulWidget {
  const Product_ListScreen({Key? key}) : super(key: key);
  static const routeName = '/product-list';
  @override
  _Product_ListScreenState createState() => _Product_ListScreenState();
}

class _Product_ListScreenState extends State<Product_ListScreen> {
  List<Product> product = [];

  Future<void> loadJsonFile() async {
    try {
      final String response = await rootBundle.loadString("asset/product.json");
      final productData = jsonDecode(response);
      var list = productData["items"] as List<dynamic>;
      setState(() {
        product = list.map((e) => Product.fromJson(e)).toList();
      });
    } catch (e) {
      print(e);
    }

    print(product.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product List'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
              onPressed: loadJsonFile, child: Text("Load Json Data")),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                   
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ProductDetailsScreen(),
                    //     ));
                    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                        arguments: jsonEncode(product[index]));
                  },
                  child: Card(
                    color: Colors.blueAccent,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          product[index].name.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
