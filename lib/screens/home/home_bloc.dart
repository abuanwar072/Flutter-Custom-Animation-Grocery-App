import 'package:animation_2/models/Product.dart';
import 'package:flutter/material.dart';

enum HomeState { normal, details, cart }

class HomeBLoC with ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItem> cart = [];

  void changeToNormal() {
    homeState = HomeState.normal;
    notifyListeners();
  }

  void changeToCart() {
    homeState = HomeState.cart;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    for (ProductItem item in cart) {
      if (item.product!.title == product.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(ProductItem(product: product));
    notifyListeners();
  }

  int totalCartElements() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}

class ProductItem {
  int quantity;
  final Product? product;

  ProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }

  void add() {}

  void substract() {}
}
