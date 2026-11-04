
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void openPage(BuildContext context, String route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3978F6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 45,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'My AI Assistant',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.chat_outlined),
              title: const Text('New Chat'),
              onTap: () => openPage(context, '/chat'),
            ),
            ListTile(
              leading: const Icon(Icons.mic_none),
              title: const Text('Voice Assistant'),
              onTap: () => openPage(context, '/voice'),
            ),
            ListTile(
              leading: const Icon(Icons.psychology_outlined),
              title: const Text('AI Memory'),
              onTap: () => openPage(context, '/memory'),
            ),
            ListTile(
              leading: const Icon(Icons.smart_toy_outlined),
              title: const Text('Agent Mode'),
              onTap: () => openPage(context, '/agent'),
            ),
            ListTile(
              leading: const Icon(Icons.build_outlined),
              title: const Text('AI Tools'),
              onTap: () => openPage(context, '/tools'),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Chat History'),
              onTap: () => openPage(context, '/history'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.folder_outlined),
              title: const Text('Files & Images'),
              onTap: () => openPage(context, '/files'),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () => openPage(context, '/settings'),
            ),
          ],
        ),
      ),
    );
  }
}
