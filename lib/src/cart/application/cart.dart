import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addProduct(Map<String, dynamic> item) {
    int itemId = item['id'];

    String itemIdString = itemId.toString();

    int existingIndex = _items
        .indexWhere((element) => element['id'].toString() == itemIdString);

    if (existingIndex != -1) {
      _items[existingIndex]['quantidade'] += item['quantidade'];
    } else {
      _items.add(item);
    }

    // ignore: avoid_print
    print(
        "Items no carrinho: ${_items.map((e) => e['nome'] + ' - ' + e['quantidade'].toString()).toList()}");

    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    _items.remove(item);
    notifyListeners();
  }

  int getQuantity() {
    int totalQuantity = _items.fold(
        0,
        (previousValue, element) =>
            previousValue + element['quantidade'] as int);

    return totalQuantity;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
