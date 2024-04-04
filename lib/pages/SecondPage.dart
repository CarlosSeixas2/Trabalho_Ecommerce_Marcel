import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Voltar para a página anterior
            Navigator.pop(context);
          },
          child: Text('Voltar'),
        ),
      ),
    );
  }
}