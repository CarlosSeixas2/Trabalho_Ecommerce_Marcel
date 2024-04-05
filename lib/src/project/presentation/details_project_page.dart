import 'package:flutter/material.dart';

class DetailsProjectPage extends StatelessWidget {
  const DetailsProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff09090B),
        appBar: AppBar(
          title: const Text('Sobre nós',
              style: TextStyle(fontSize: 24, color: Colors.white)),
          toolbarHeight: 90,
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
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/houston.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: const Color(0xff01FC80),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Houston Barros',
                              style: TextStyle(
                                color: Color(0xffFAFAFA),
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/carlos.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: const Color(0xff01FC80),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Carlos Seixas',
                              style: TextStyle(
                                color: Color(0xffFAFAFA),
                                fontSize: 24,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Sobre o projeto',
                          style: TextStyle(
                            color: Color(0xffA1A1AA),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Esta é uma aplicação mobile em Flutter que fornece um catálogo de produtos.',
                          style: TextStyle(
                            color: Color(0xffFAFAFA),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Descrição',
                          style: TextStyle(
                            color: Color(0xffA1A1AA),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Você está desenvolvendo um aplicativo de catálogo de produtos para uma loja online. O aplicativo deve permitir que os usuários visualizem uma lista de produtos e vejam detalhes sobre cada produto selecionado. Utilize os widgets fundamentais do Flutter para criar esta aplicação.',
                          style: TextStyle(
                            color: Color(0xffFAFAFA),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Mais informações',
                          style: TextStyle(
                            color: Color(0xffA1A1AA),
                            fontSize: 16,
                          ),
                        ),
                        Divider(
                          color: Color(0xff27272A),
                          thickness: 1,
                        ),
                        Text(
                          'Professor',
                          style: TextStyle(
                            color: Color(0xffA1A1AA),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Marcel Raimundo de Souza Moura',
                          style: TextStyle(
                            color: Color(0xffFAFAFA),
                            fontSize: 18,
                          ),
                        ),
                        Divider(
                          color: Color(0xff27272A),
                          thickness: 1,
                        ),
                        Text(
                          'Disciplina',
                          style: TextStyle(
                            color: Color(0xffA1A1AA),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Programação para Dispositivos Móveis',
                          style: TextStyle(
                            color: Color(0xffFAFAFA),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
