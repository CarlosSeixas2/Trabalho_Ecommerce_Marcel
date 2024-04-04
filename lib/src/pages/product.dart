import 'package:flutter/material.dart';
import '../mocks/products.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.idProduto});

  final int idProduto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${ProductsMock.getProductById(idProduto)['nome']}'),
      // ),
      // Tirar a barra de navegação
      appBar: null,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                'assets/images/notebook.jpg',
                fit: BoxFit.cover, // Para cobrir toda a área
                width: double.infinity,
                height: 400,
              ),
              Positioned(
                top: 50.0,
                left: 10.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Voltar para a pÃ¡gina anterior
                    Navigator.pop(context);
                  },
                  child: Text('Voltar'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${ProductsMock.getProductById(idProduto)['descricao']}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Preço: R\$ ${ProductsMock.getProductById(idProduto)['preco']}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Quantidade: ${ProductsMock.getProductById(idProduto)['quantidade']}',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
