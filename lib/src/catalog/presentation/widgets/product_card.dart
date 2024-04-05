import 'package:flutter/material.dart';
import 'package:spark_informatica/src/product/domain/product_repo.dart';
import 'package:spark_informatica/src/product/presentation/pages/product_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.id,
    required this.nome,
    required this.preco,
    required this.onDelete,
  }) : super(key: key);

  final int id;
  final String nome;
  final double preco;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final bool isDeleted =
    produtos.firstWhere((produto) => produto['id'] == id)['deletado'];

    return isDeleted
        ? SizedBox.shrink()
        : SizedBox(
      width: 140,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(idProduto: id),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: Stack(children: [
                Container(
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
                Positioned(
                  top: 5.0,
                  right: 5.0,
                  child: IconButton(
                    onPressed: onDelete,
                    iconSize: 20,
                    icon: const Icon(Icons.delete),
                    color: Colors.white,
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  nome,
                  style: const TextStyle(
                    color: Color(0xffFAFAFA),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '${produtos.firstWhere((element) => element['id'] == id)['quantidade']} unidades',
                  style: const TextStyle(
                    color: Color(0xffA1A1AA),
                    fontSize: 12,
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
