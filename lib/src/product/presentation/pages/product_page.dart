import 'package:flutter/material.dart';
import 'package:spark_informatica/src/product/domain/product_repo.dart';
import 'package:spark_informatica/src/product/presentation/widgets/bottom_bar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.idProduto});

  final int idProduto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color(0xff09090B),
      body: SingleChildScrollView(
          child: Column(
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
                  color: Colors.black,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'Apenas ${ProductsMock.getProductById(idProduto)['quantidade']} disponíveis',
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff01FC80),
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Text(
                        '${ProductsMock.getProductById(idProduto)['nome']}',
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Text(
                        '${ProductsMock.getProductById(idProduto)['descricao']}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xffA1A1AA),
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(height: 15),
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
      )),
      bottomNavigationBar: BottomBar(idProduto: idProduto),
    );
  }
}
