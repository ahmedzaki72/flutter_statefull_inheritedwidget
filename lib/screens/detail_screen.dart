import 'package:flutter/material.dart';
import 'package:flutter_inherited_shoping/shopping_cart.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = ShoppingCart.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Detail'),
      ),
      body: Center(
        child: Text(
          '${cart.products.length} Selected',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
