import 'package:flutter/material.dart';

import 'home_page.dart';

/// Pastki navigatsiya paneli bilan asosiy qobiq.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const List<Widget> _pages = [
    HomePage(),
    _Placeholder('Muloqot'),
    _Placeholder('Yangiliklar'),
    _Placeholder('Hisob'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.menu_book_rounded), label: 'Darslar'),
          NavigationDestination(
              icon: Icon(Icons.chat_bubble_rounded), label: 'Muloqot'),
          NavigationDestination(
              icon: Icon(Icons.newspaper_rounded), label: 'Yangiliklar'),
          NavigationDestination(
              icon: Icon(Icons.person_rounded), label: 'Hisob'),
        ],
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final String title;
  const _Placeholder(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title bo\'limi tez orada',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
