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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3157A4)),
        useMaterial3: true,
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SimplePage(
      title: 'Muloqot',
      message: 'Bu bo‘limda menejerga yozish va boshqalar bilan muloqot qilish imkoniyatlari qo‘shiladi.',
      icon: Icons.chat_bubble_outline,
    ),
    SimplePage(
      title: 'Yangiliklar',
      message: 'Bu yerda foydali yangiliklar va qisqa videolar joylashtiriladi.',
      icon: Icons.newspaper_outlined,
    ),
    SimplePage(
      title: 'Hisob',
      message: 'Bu bo‘limda foydalanuvchi ma’lumotlari va obunalar ko‘rsatiladi.',
      icon: Icons.account_circle_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Darslar'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Muloqot'),
          NavigationDestination(icon: Icon(Icons.newspaper_outlined), selectedIcon: Icon(Icons.newspaper), label: 'Yangiliklar'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Hisob'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const grades = [
    GradeInfo(1, '1-sinf', Color(0xFF3F78C5)),
    GradeInfo(2, '2-sinf', Color(0xFF2D8A75)),
    GradeInfo(3, '3-sinf', Color(0xFFDA8A32)),
    GradeInfo(4, '4-sinf', Color(0xFF8056A8)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inson Farosat', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Bilim va tarbiya sari birga!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'O‘zingizga mos sinfni tanlang.',
            style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 20),
          ...grades.map(
            (grade) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GradeCard(
                grade: grade,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => GradePage(grade: grade)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, size: 32),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Har kuni yangi bilim, yaxshi odat va ezgu fikr sari qadam qo‘ying.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradeInfo {
  final int number;
  final String title;
  final Color color;

  const GradeInfo(this.number, this.title, this.color);
}

class GradeCard extends StatelessWidget {
  final GradeInfo grade;
  final VoidCallback onTap;

  const GradeCard({super.key, required this.grade, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [grade.color, grade.color.withValues(alpha: 0.78)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.school_outlined, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      grade.title,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text('30 ta video dars', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class GradePage extends StatelessWidget {
  final GradeInfo grade;

  const GradePage({super.key, required this.grade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(grade.title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.ondemand_video_outlined, size: 64, color: grade.color),
              const SizedBox(height: 16),
              Text('${grade.title} darslari', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(
                'Bu boshlang‘ich ko‘rinish. Keyingi bosqichda 30 ta dars ro‘yxati, bepul birinchi dars va obuna orqali ochiladigan darslarni qo‘shamiz.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Darslar ro‘yxati keyingi bosqichda qo‘shiladi.')),
                ),
                child: const Text('Darslarni ko‘rish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const SimplePage({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 64, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(message, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
