
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat History')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.chat_bubble_outline),
            title: Text('Previous Conversation'),
            subtitle: Text('No saved conversation yet'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Recent Activities'),
            subtitle: Text('Your recent AI activities'),
          ),
          Divider(),
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Chat history storage will be added later.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
