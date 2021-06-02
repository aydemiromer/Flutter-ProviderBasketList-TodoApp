import 'package:flutter/material.dart';

class TextModel extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _products2 = [];
  int _total = 0;

  List<Product> get allProducts => _products;

  void add(Product product) {
    _products2.add(product);
    _total += product.price;
    notifyListeners();
  }

  void delete(Product product) {
    _total -= product.price;
    _products2.remove(product);
    notifyListeners();
  }

  int get total {
    return _total;
  }

  List<Product> get shoppingCard {
    return _products2;
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void deleteProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  int get count {
    return _products.length;
  }

  int get countadd {
    return _products2.length;
  }
}

class Product {
  String productName;
  int price;
  bool isCompleted;
  Product({this.isCompleted, this.price, this.productName});
}
