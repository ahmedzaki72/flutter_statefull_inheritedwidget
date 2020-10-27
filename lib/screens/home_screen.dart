import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_inherited_shoping/Model/product.dart';
import 'package:badges/badges.dart';
import 'package:flutter_inherited_shoping/screens/detail_screen.dart';
import 'package:flutter_inherited_shoping/shopping_cart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> items = List.generate(100, (index) {
    return Product(
      name: 'Product $index',
      price: Random().nextInt(5000),
      check: false,
    );
  });

  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = ShoppingCart.of(context);
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Shopping Cart'),
            actions: [
              Container(
                margin: EdgeInsets.only(top: 15, right: 25),
                child: Badge(
                  badgeContent: Text(
                    '${cart.products.length}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(items[index].name),
                        ),
                        Checkbox(
                            value: items[index].check,
                            onChanged: (value) {
                              setState(() {
                                items[index].check = !items[index].check;
                                if(items[index].check) {
                                  cart.products.add(items[index]);
                                }else{
                                  cart.products.remove(items[index]);
                                }
                              });
                            }),
                      ],
                    ),
                    subtitle: Text('${items[index].price} EGP'),
                  ),
                );
              }),
        );
      },
    );
  }
}
