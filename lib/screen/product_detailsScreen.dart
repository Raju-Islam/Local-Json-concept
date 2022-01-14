// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_json_full_consept/model/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static const routeName = "/details";
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var productName = '';
  
  Product? product;
  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var productString = ModalRoute.of(context)?.settings.arguments as String;
    print(productString);
    var productjson = jsonDecode(productString);
    print(productjson);
    setState(() {
      product = Product.fromJson(productjson);
      productName = product!.name!;
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          productName,
        ),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(product!.id.toString()),
          Text(product!.name.toString()),
          Text(product!.desciption.toString())
        ],
      ),
    );
  }
}
