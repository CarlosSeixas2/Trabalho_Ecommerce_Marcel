import 'package:flutter/material.dart';

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
