import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
      '/profile': (context) => const SimpleScreen(title: 'Profile', color: Color.fromARGB(255, 90, 107, 137)),
      '/messages': (context) => const SimpleScreen(title: 'Messages', color: Color.fromARGB(255, 61, 82, 61)),
      '/about': (context) => const SimpleScreen(title: 'About', color: Color.fromARGB(255, 213, 169, 104)),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Menu')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: () => Navigator.pushNamed(context, '/messages'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}

class SimpleScreen extends StatelessWidget {
  final String title;
  final Color color;
  const SimpleScreen({super.key, required this.title, required this.color});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: color),
      body: Center(
        child: Text('$title Screen', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}