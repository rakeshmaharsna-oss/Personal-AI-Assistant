
import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  final List<Map<String, dynamic>> tools = const [
    {'name': 'Web Search', 'icon': Icons.search},
    {'name': 'Calculator', 'icon': Icons.calculate_outlined},
    {'name': 'Camera', 'icon': Icons.camera_alt_outlined},
    {'name': 'Gallery', 'icon': Icons.photo_library_outlined},
    {'name': 'Documents', 'icon': Icons.description_outlined},
    {'name': 'Maps', 'icon': Icons.map_outlined},
    {'name': 'Calendar', 'icon': Icons.calendar_month_outlined},
    {'name': 'Reminders', 'icon': Icons.notifications_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Tools')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemCount: tools.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${tools[index]['name']} will be connected later',
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    tools[index]['icon'] as IconData,
                    size: 38,
                    color: const Color(0xFF3978F6),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    tools[index]['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
