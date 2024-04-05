import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_informatica/src/cart/application/cart.dart';
import 'package:spark_informatica/src/catalog/presentation/pages/catalog_page.dart';
import 'package:spark_informatica/src/product/domain/product_repo.dart';
import 'package:spark_informatica/src/product/presentation/widgets/product_count.dart';

class BottomBar extends StatefulWidget {
  final int idProduto;

  const BottomBar({super.key, required this.idProduto});

  @override
  // ignore: no_logic_in_create_state
  BottomBarState createState() => BottomBarState(idProduto: idProduto);
}

class BottomBarState extends State<BottomBar> {
  late int _quantity;
  final int idProduto;

  BottomBarState({required this.idProduto});

  @override
  void initState() {
    super.initState();
    _quantity = 1;
  }

  void _updateQuantity(int newQuantity) {
    setState(() {
      _quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    num totalPrice =
        _quantity * ProductsMock.getProductById(idProduto)['preco'];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff09090B),
            Color(0xff001008),
          ],
        ),
        border: Border(
          top: BorderSide(
            color: Color(0xff1A1A1A),
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductCount(
            onQuantityChanged: _updateQuantity,
            idProduct: idProduto,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Adicionar ao carrinho'),
                    content: const Text(
                        'Deseja adicionar este produto ao carrinho?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<Cart>().addProduct({
                            'id': ProductsMock.getProductById(idProduto)['id'],
                            'nome':
                                ProductsMock.getProductById(idProduto)['nome'],
                            'descricao': ProductsMock.getProductById(
                                idProduto)['descricao'],
                            'preco':
                                ProductsMock.getProductById(idProduto)['preco'],
                            'quantidade': _quantity,
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CatalogPage(),
                            ),
                          );
                        },
                        child: const Text('Adicionar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.9,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xff01FC80),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Adicionar',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'R\$ ${totalPrice.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
