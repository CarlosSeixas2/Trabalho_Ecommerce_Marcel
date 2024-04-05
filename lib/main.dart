import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_informatica/src/catalog/presentation/pages/catalog_page.dart';
import 'package:spark_informatica/src/cart/application/cart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      initialRoute: '/',
      routes: {'/': (context) => const CatalogPage()},
    );
  }
}
