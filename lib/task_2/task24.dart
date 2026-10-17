import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
      '/profile': (context) => const ProfileScreen(),
      '/messages': (context) => const MessagesScreen(),
      '/about': (context) => const AboutScreen(),
    },
  ));
}
class AppDrawer extends StatelessWidget {
  final String currentRoute;
  const AppDrawer({super.key, required this.currentRoute});

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pop(context);
    if (currentRoute != routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Navigation Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: currentRoute == '/',
            onTap: () => _navigateTo(context, '/'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            selected: currentRoute == '/profile',
            onTap: () => _navigateTo(context, '/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            selected: currentRoute == '/messages',
            onTap: () => _navigateTo(context, '/messages'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            selected: currentRoute == '/about',
            onTap: () => _navigateTo(context, '/about'),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const AppDrawer(currentRoute: '/'),
      body: const Center(
        child: Text('Home Screen', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      drawer: const AppDrawer(currentRoute: '/profile'),
      body: const Center(
        child: Text('Profile Screen', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      drawer: const AppDrawer(currentRoute: '/messages'),
      body: const Center(
        child: Text('Messages Screen', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      drawer: const AppDrawer(currentRoute: '/about'),
      body: const Center(
        child: Text('About Screen', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}