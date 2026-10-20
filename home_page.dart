import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/grade_card.dart';
import 'grade_page.dart';

/// Darslar: 4 ta sinf kartasi darhol ko'rinadi.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Salom! 👋',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(
            'Qaysi sinfda o\'qiysiz?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: List.generate(4, (i) {
                final grade = i + 1;
                return GradeCard(
                  grade: grade,
                  color: AppTheme.gradeColors[i],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GradePage(grade: grade),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
