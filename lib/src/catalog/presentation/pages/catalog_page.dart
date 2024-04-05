import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_informatica/src/cart/application/cart.dart';
import 'package:spark_informatica/src/catalog/presentation/widgets/category_card.dart';
import 'package:spark_informatica/src/catalog/presentation/widgets/product_card.dart';
import 'package:spark_informatica/src/catalog/presentation/widgets/bottom_bar.dart';
import 'package:spark_informatica/src/product/domain/product_repo.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

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
                child: const Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                    ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        for (var categoria in [
                          'Periféricos',
                          'Espaço Gamer',
                          'Hardware',
                          'Computadores'
                        ])
                          Row(
                            children: [
                              CategoryCard(nome: categoria),
                              const SizedBox(width: 15),
                            ],
                          ),
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
                          'Recomendados',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFAFAFA),
                          ),
                        ),
                        Text(
                          'Ver todos',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff01FC80),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Periféricos',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFAFAFA),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Ver todos os periféricos');
                          },
                          child: const Text(
                            'Ver todos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff01FC80),
                            ),
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
                return BottomBar();
              } else {
                return const SizedBox.shrink();
              }
            },
          )),
    );
  }
}
