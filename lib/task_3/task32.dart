import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Task32Screen1()));

class Task32Screen1 extends StatefulWidget {
  const Task32Screen1({super.key});

  @override
  State<Task32Screen1> createState() => _Task32Screen1State();
}

class _Task32Screen1State extends State<Task32Screen1> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 3.2: Greeting')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter your name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Task32Screen2(name: _controller.text),
                  ),
                );
              },
              child: const Text('Greet'),
            ),
          ],
        ),
      ),
    );
  }
}

class Task32Screen2 extends StatelessWidget {
  final String name;
  const Task32Screen2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Greeting')),
      body: Center(
        child: Text(
          'Hello, $name!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}