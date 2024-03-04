import 'package:coffee/components/coffee_tile.dart';
import 'package:coffee/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItem (Coffee coffee){
     Provider.of<CoffeeShop>(context,listen:false).removeItemFromCart(coffee);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => Column(
      children: [
        Text('Your Cart',style: TextStyle(color: Colors.grey.shade500),),
        //list of cart
        Expanded(
          child: ListView.builder(
            itemCount: value.userCart.length,
            itemBuilder: (context,index){
              Coffee eachCoffee=value.userCart[index];
              return CoffeeTile(coffee: eachCoffee, onPressed: ()=>removeItem(eachCoffee),icon:Icon(Icons.delete));
          }),
        )
      ],
    )
    );
  }
}