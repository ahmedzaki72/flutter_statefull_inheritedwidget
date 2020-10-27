import 'package:flutter/cupertino.dart';
import 'package:flutter_inherited_shoping/Model/product.dart';
import 'package:collection/collection.dart';

class ShoppingCart extends InheritedWidget {
  List<Product> products = [];
  Widget child;

  ShoppingCart({this.child});

  @override
  bool updateShouldNotify(ShoppingCart oldWidget) {
    /// i'm using collection library to compare between to arrays.
    return IterableEquality().equals(products, oldWidget.products);
  }

  /// this method using reference

  static ShoppingCart of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

}