import 'package:flutter/material.dart';

import 'pages/main_shell.dart';
import 'theme/app_theme.dart';

void main() => runApp(const InsonFarosatApp());

class InsonFarosatApp extends StatelessWidget {
  const InsonFarosatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inson Farosat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MainShell(),
    );
  }
}
