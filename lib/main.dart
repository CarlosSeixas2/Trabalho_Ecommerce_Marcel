import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> produtos = [
    {
      "id": 1,
      "nome": "Notebook",
      "descricao": "Notebook ultrafino com SSD",
      "preco": 899.99,
      "quantidade": 5
    },
    {
      "id": 2,
      "nome": "Mouse",
      "descricao": "Mouse óptico sem fio",
      "preco": 19.99,
      "quantidade": 50
    },
    {
      "id": 3,
      "nome": "Teclado",
      "descricao": "Teclado mecânico RGB",
      "preco": 59.99,
      "quantidade": 30
    },
    {
      "id": 4,
      "nome": "Monitor",
      "descricao": "Monitor LED 24 polegadas",
      "preco": 199.99,
      "quantidade": 20
    },
    {
      "id": 5,
      "nome": "Placa de Vídeo RTX 4050",
      "descricao": "Placa de vídeo NVIDIA GeForce RTX 3060",
      "preco": 499.99,
      "quantidade": 10
    }
  ];

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
          actions: [
            IconButton(
              onPressed: () {
                print('Pesquisar');
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Opções'),
              ),
              ListTile(
                title: const Text('Equipe'),
                onTap: () {
                  print('Dados da Equipe');
                },
              ),
            ],
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
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.id, required this.nome, required this.preco});

  final int id;
  final String nome;
  final double preco;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(
                idProduto: id,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/notebook.jpg'),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),

                const Text(
                  "Apenas 5 unidades",
                  style: TextStyle(
                    color: Color(0xffA1A1AA),
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                Text(
                  nome,
                  style: const TextStyle(
                    color: Color(0xffFAFAFA),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                Text(
                  'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: const TextStyle(
                    color: Color(0xff01FC80),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.nome});

  final String nome;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nome.length * 10 + 10,
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xff09090B),
              Color(0xff001008),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: const Color(0xff27272A),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            nome,
            style: const TextStyle(
              color: Color(0xffFAFAFA),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.idProduto});

  final int idProduto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto $idProduto'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Voltar para a pÃ¡gina anterior
            Navigator.pop(context);
          },
          child: Text('Voltar'),
        ),
      ),
    );
  }
}
