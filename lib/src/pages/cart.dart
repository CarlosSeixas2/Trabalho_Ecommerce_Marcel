import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import './product.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
        backgroundColor: const Color(0xff09090B),
        appBar: AppBar(
          title: const Text(
            'Carrinho',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff09090B),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff01FC80)),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              idProduto: cart.items[index]['id'],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/notebook.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: const Color(0xff27272A),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cart.items[index]['nome'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      cart.items[index]['descricao'],
                                      style: const TextStyle(
                                        color: Color(0xffA1A1AA),
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'R\$ ${cart.items[index]['preco'].toStringAsFixed(2).replaceAll('.', ',')}',
                                      style: const TextStyle(
                                          color: Color(0xff01FC80),
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              cart.removeItem(cart.items[index]);
                            },
                          ),
                        ],
                      ));
                },
              ),
              // Text('Total: ${cart.totalPrice}'),
            ],
          ),
        ));
  }
}
