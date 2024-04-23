import 'package:backup/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    //product 1
    Product(name: "Guitar", 
    price: 10000.0, 
    description: 'rustic guitar', 
    imagePath: 'images/guitar.jpg',
    ),


    Product(name: "Drum", 
    price: 60000.0, 
    description: 'Bass drums with full kit', 
    imagePath: 'images/drums.jpg',
    ),


    Product(name: "Piano", 
    price: 90000.0, 
    description: 'rustic guitar', 
    imagePath: 'images/piano.jpg',
    ),


    Product(name: "Guitar", 
    price: 10000.0, 
    description: 'rustic guitar', 
    imagePath: 'images/2ndlogo.png',
    ),


  ];

  // user cart

  List<Product> _cart= [];

  // get product list
  List<Product> get shop => _shop;

  //get user cart
    List<Product> get cart => _cart;

  //add item
  void addToCart(Product item) {
    _cart.add(item);
  }

  //remove 
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();

  }




}