import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
      '/square': (context) => const SquareScreen(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 4.2: Send a Number')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [1, 2, 3].map((number) {
            return ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/square', arguments: number);
              },
              child: Text('$number'),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final number = ModalRoute.of(context)!.settings.arguments as int;
    final square = number * number;

    return Scaffold(
      appBar: AppBar(title: const Text('Square')),
      body: Center(
        child: Text(
          'Number: $number\nSquare: $square',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}