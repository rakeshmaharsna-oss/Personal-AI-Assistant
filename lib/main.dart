
import 'package:flutter/material.dart';

void main() {
  runApp(const PersonalAIAssistant());
}

class PersonalAIAssistant extends StatelessWidget {
  const PersonalAIAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal AI Assistant',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3978F6),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FD),
      ),
      home: const AssistantHome(),
    );
  }
}

class AssistantHome extends StatefulWidget {
  const AssistantHome({super.key});

  @override
  State<AssistantHome> createState() => _AssistantHomeState();
}

class _AssistantHomeState extends State<AssistantHome> {
  final TextEditingController controller = TextEditingController();

  String message = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      message = controller.text.trim();
      controller.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('AI Brain अभी जोड़ा नहीं गया है।'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FD),
        title: const Text(
          'My AI Assistant',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu coming soon')),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings coming soon')),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFB8D6FF),
                    Color(0xFF3978F6),
                  ],
                  stops: [0.15, 0.65, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3978F6)
                        .withOpacity(0.25),
                    blurRadius: 45,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.auto_awesome_rounded,
                  size: 65,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Hello! I am your AI Assistant',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF172033),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'How can I help you today?',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF9299A8),
              ),
            ),

            if (message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('You: $message'),
              ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFE3EAF5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline),
                      color: const Color(0xFF3978F6),
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onSubmitted: (_) => sendMessage(),
                        decoration: const InputDecoration(
                          hintText: 'Ask me anything...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mic_none_rounded),
                      color: const Color(0xFF3978F6),
                    ),
                    IconButton(
                      onPressed: sendMessage,
                      icon: const Icon(Icons.send_rounded),
                      color: Colors.white,
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF3978F6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
