import 'package:flutter/material.dart';
import '../mocks/products.dart';

class ProductCount extends StatefulWidget {
  @override
  _ProductCountState createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> {
  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
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
          color: Color(0xff01FC80),
        ),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.idProduto});

  final int idProduto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color(0xff09090B),
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  'assets/images/notebook.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                ),
              ),
              Positioned(
                top: 50.0,
                left: 10.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Apenas ${ProductsMock.getProductById(idProduto)['quantidade']} disponíveis',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff01FC80),
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${ProductsMock.getProductById(idProduto)['nome']}',
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${ProductsMock.getProductById(idProduto)['descricao']}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xffA1A1AA),
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'R\$ ${ProductsMock.getProductById(idProduto)['preco'].toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(
                          fontSize: 28,
                          color: Color(0xff01FC80),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ProductCount(), // Adiciona o widget de contagem de produtos
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirmação de Compra'),
                    content: Text('Deseja confirmar a compra?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          print('Compra cancelada!');
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          print('Compra realizada com sucesso!');
                        },
                        child: const Text('Confirmar'),
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Comprar',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' R\$ 999,99',
                    style: TextStyle(
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
