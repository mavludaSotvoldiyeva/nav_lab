import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;
  final String city;

  User({required this.name, required this.age, required this.city});
}

void main() {
  runApp(MaterialApp(
    onGenerateRoute: (settings) {
      if (settings.name == '/') {
        return MaterialPageRoute(builder: (context) => const UserListScreen());
      }
      if (settings.name == '/profile') {
        if (settings.arguments is User) {
          final user = settings.arguments as User;
          return MaterialPageRoute(
            builder: (context) => ProfileScreen(user: user),
          );
        }
      }
      return null;
    },
  ));
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<User> users = [
      User(name: 'Alice', age: 25, city: 'New York'),
      User(name: 'Bob', age: 30, city: 'London'),
      User(name: 'Charlie', age: 22, city: 'Tokyo'),
      User(name: 'Diana', age: 28, city: 'Paris'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Task 4.4: onGenerateRoute')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            onTap: () {
              Navigator.pushNamed(context, '/profile', arguments: user);
            },
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Age: ${user.age}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('City: ${user.city}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}