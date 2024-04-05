import 'package:flutter/material.dart';

class DetailsProjectPage extends StatelessWidget {
  const DetailsProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Página'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Voltar para a Página Inicial'),
        ),
      ),
    );
  }
}
