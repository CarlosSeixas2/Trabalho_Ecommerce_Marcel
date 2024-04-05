import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_informatica/src/cart/application/cart.dart';
import 'package:spark_informatica/src/cart/presentation/pages/cart_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff09090B), Color(0xff001008)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border(
          top: BorderSide(
            color: Color(0xff27272A),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000),
            offset: Offset(0, -1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: 15,
              ),
              Text(
                'R\$ ${context.watch<Cart>().items.fold(0.0, (previousValue, element) => previousValue + element['preco'] * element['quantidade']).toStringAsFixed(2).replaceAll('.', ',')}',
                style: const TextStyle(
                  color: Color(0xffFAFAFA),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' / ${context.watch<Cart>().getQuantity()} itens',
                style: const TextStyle(
                  color: Color(0xffA1A1AA),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xff01FC80),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ver carrinho',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ]),
        ],
      ),
    );
  }
}
