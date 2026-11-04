
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool voiceEnabled = true;
  bool memoryEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Assistant Profile'),
            subtitle: Text('My AI Assistant'),
          ),
          const Divider(),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text('Dark Mode'),
            value: darkMode,
            onChanged: (value) {
              setState(() => darkMode = value);
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.mic_none),
            title: const Text('Voice Assistant'),
            value: voiceEnabled,
            onChanged: (value) {
              setState(() => voiceEnabled = value);
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.psychology_outlined),
            title: const Text('AI Memory'),
            value: memoryEnabled,
            onChanged: (value) {
              setState(() => memoryEnabled = value);
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.security_outlined),
            title: Text('Privacy & Security'),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About App'),
            subtitle: Text('Version 1.0.0'),
          ),
        ],
      ),
    );
  }
}
