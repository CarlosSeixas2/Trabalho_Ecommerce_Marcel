import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_informatica/src/cart/application/cart.dart';
import 'package:spark_informatica/src/catalog/presentation/pages/catalog_page.dart';
import 'package:spark_informatica/src/product/presentation/pages/product_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: cart.items.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'Carrinho Vazio',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CatalogPage()),
                        );
                      },
                      child: const Text('Adicionar Produtos'),
                    ),
                  ],
                ),
              )
            : Column(
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
                              builder: (context) => ProductPage(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          fontSize: 20,
                                        ),
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
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
