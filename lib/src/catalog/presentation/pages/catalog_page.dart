import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_informatica/src/cart/application/cart.dart';
import 'package:spark_informatica/src/cart/presentation/pages/cart_page.dart';
import 'package:spark_informatica/src/catalog/presentation/widgets/product_card.dart';
import 'package:spark_informatica/src/catalog/presentation/widgets/bottom_bar.dart';
import 'package:spark_informatica/src/product/domain/product_repo.dart';
import 'package:spark_informatica/src/project/presentation/details_project_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      home: Scaffold(
        backgroundColor: const Color(0xff09090B),
        appBar: AppBar(
          toolbarHeight: 90,
          title: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
            height: 35,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Color(0xffFAFAFA),
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff09090B), Color(0xff001008)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border(
                bottom: BorderSide(
                  color: Color(0xff27272A),
                  width: 1,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000),
                  offset: Offset(0, 1),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: SizedBox(
            width: 250,
            child: Container(
              color: const Color(0xff09090B),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 30,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Color(0xffFAFAFA),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Início',
                              style: TextStyle(
                                  color: Color(0xffFAFAFA), fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Color(0xffFAFAFA),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Carrinho',
                              style: TextStyle(
                                  color: Color(0xffFAFAFA), fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailsProjectPage(),
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Color(0xffFAFAFA),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Sobre nós',
                              style: TextStyle(
                                  color: Color(0xffFAFAFA), fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recomendados',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFAFAFA),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var produto in produtos)
                        Row(
                          children: [
                            ProductCard(
                              id: produto['id'],
                              nome: produto['nome'],
                              preco: produto['preco'],
                              onDelete: () {
                                setState(() {
                                  produto['deletado'] = true;
                                });
                              },
                            ),
                            if (produtos.last != produto)
                              const SizedBox(width: 25),
                          ],
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Periféricos',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFAFAFA),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var produto in produtos)
                        Row(
                          children: [
                            ProductCard(
                              key: UniqueKey(),
                              id: produto['id'],
                              nome: produto['nome'],
                              preco: produto['preco'],
                              onDelete: () {
                                // Chamada da função de exclusão
                                setState(() {
                                  produto['deletado'] = true;
                                });
                              },
                            ),
                            if (produtos.last != produto)
                              const SizedBox(width: 25),
                          ],
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Consumer<Cart>(
          builder: (context, cart, child) {
            if (cart.items.isNotEmpty) {
              return const BottomBar();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
