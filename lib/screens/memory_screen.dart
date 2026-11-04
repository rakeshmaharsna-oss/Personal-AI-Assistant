
import 'package:flutter/material.dart';

class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Memory')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(
            Icons.psychology_rounded,
            size: 75,
            color: Color(0xFF3978F6),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text(
              'Your AI Memories',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Card(
            child: ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Personal Information'),
              subtitle: Text('User-approved information'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.star_outline),
              title: Text('Preferences'),
              subtitle: Text('Saved preferences'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.history),
              title: Text('Conversation Memories'),
              subtitle: Text('Important past conversations'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Memory storage will be connected later.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
