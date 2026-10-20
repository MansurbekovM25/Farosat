
import 'package:flutter/material.dart';

void main() {
  runApp(const InsonFarosatApp());
}

class InsonFarosatApp extends StatelessWidget {
  const InsonFarosatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inson Farosat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final grades = ['1-sinf', '2-sinf', '3-sinf', '4-sinf'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inson Farosat'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Bilim va tarbiya sari!',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text('O‘zingizga mos sinfni tanlang.'),
          const SizedBox(height: 16),
          for (final grade in grades)
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.school),
                ),
                title: Text(grade),
                subtitle: const Text('30 ta dars'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LessonsPage(grade: grade),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: const NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'Darslar',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Muloqot',
          ),
          NavigationDestination(
            icon: Icon(Icons.newspaper),
            label: 'Yangiliklar',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Hisob',
          ),
        ],
      ),
    );
  }
}

class LessonsPage extends StatelessWidget {
  final String grade;

  const LessonsPage({super.key, required this.grade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(grade)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 30,
        itemBuilder: (context, index) {
          final number = index + 1;
          return Card(
            child: ListTile(
              leading: const Icon(Icons.play_circle_outline),
              title: Text('$number-dars'),
              subtitle: Text(
                number == 1
                    ? 'Bepul dars'
                    : 'Obuna orqali ochiladi',
              ),
              trailing: number == 1
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.lock_outline),
            ),
          );
        },
      ),
    );
  }
}
