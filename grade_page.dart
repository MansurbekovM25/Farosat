import 'package:flutter/material.dart';

/// Sinf sahifasi. 30 ta dars ro'yxati 3-bosqichda qo'shiladi.
class GradePage extends StatelessWidget {
  final int grade;
  const GradePage({super.key, required this.grade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$grade-sinf')),
      body: const Center(
        child: Text('Darslar ro\'yxati keyingi bosqichda qo\'shiladi'),
      ),
    );
  }
}
