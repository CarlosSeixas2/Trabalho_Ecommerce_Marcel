import 'package:flutter/material.dart';
import 'package:spark_informatica/src/product/domain/product_repo.dart';

class ProductCount extends StatefulWidget {
  final Function(int) onQuantityChanged;
  final int idProduct;

  const ProductCount(
      {super.key, required this.onQuantityChanged, required this.idProduct});

  @override
  // ignore: no_logic_in_create_state
  ProductCountState createState() => ProductCountState(idProduct: idProduct);
}

class ProductCountState extends State<ProductCount> {
  int _quantity = 1;
  late int idProduct;

  ProductCountState({required this.idProduct});

  void _increment() {
    if (_quantity < ProductsMock.getProductById(idProduct)['quantidade']) {
      setState(() {
        _quantity++;
        widget.onQuantityChanged(_quantity);
      });
    }
  }

  void _decrement() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        widget.onQuantityChanged(_quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrement,
          color: _quantity > 1 ? Colors.white : const Color(0xffA1A1AA),
        ),
        const SizedBox(width: 15),
        Text(
          '$_quantity',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _increment,
          color:
              _quantity < ProductsMock.getProductById(idProduct)['quantidade']
                  ? const Color(0xff01FC80)
                  : const Color(0xffA1A1AA),
        ),
      ],
    );
  }
}
