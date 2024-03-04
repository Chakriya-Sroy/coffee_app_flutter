
import 'package:flutter/material.dart';
import './coffee.dart';

class CoffeeShop extends ChangeNotifier{
  // coffee for sale list
  final List<Coffee>_shop=[
    Coffee(name:'Ice Americano',price:'1.5'),
    Coffee(name:'Ice capucino',price:'1.5'),
    Coffee(name:'Ice latte',price:'2.5'),
  ];
  // user cart
  List<Coffee>_userCart=[];
  // get coffee list
  List<Coffee>get coffeeShop=> _shop;
  //get user cart
  List<Coffee>get userCart=>_userCart;
  // add item to cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }
  //remove item from cart
  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}