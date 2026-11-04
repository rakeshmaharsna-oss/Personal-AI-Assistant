
import 'package:flutter/material.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Agent')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(
            Icons.smart_toy_rounded,
            size: 80,
            color: Color(0xFF3978F6),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'AI Agent Center',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Card(
            child: ListTile(
              leading: Icon(Icons.assignment_outlined),
              title: Text('My Tasks'),
              subtitle: Text('Manage your AI tasks'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.pending_actions),
              title: Text('Pending Approvals'),
              subtitle: Text('Actions waiting for permission'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.history),
              title: Text('Agent Activity'),
              subtitle: Text('View completed activities'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Agent execution will be added later.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
