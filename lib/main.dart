import 'package:flutter/material.dart';
import 'package:flutter_inherited_shoping/screens/home_screen.dart';
import 'package:flutter_inherited_shoping/shopping_cart.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingCart(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        home: HomeScreen(),
      ),
    );
  }
}
