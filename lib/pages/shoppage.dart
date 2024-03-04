import 'package:coffee/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffee_tile.dart';
import '../models/coffee.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context,listen:false).addItemToCart(coffee);
    // let user know it add item successfuly added
    showDialog(
      context: context,
      builder: (context)=>AlertDialog(title: Text('Successfully Added'),));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer <CoffeeShop>(
      builder:(context,value,child)=>SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text('How would you like your cofee ?',style: TextStyle(color: Colors.grey.shade500,fontSize: 20),),
              SizedBox(height:20 ,),
              //list of coffee
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context,index){
                  //get individual coffee
                  Coffee eachCofee=value.coffeeShop[index];
                  return CoffeeTile(coffee: eachCofee, onPressed: ()=> addToCart(eachCofee),icon: Icon(Icons.add),);
                })
              )
            ],
          ),
        ),
      ),
    );
  }
}