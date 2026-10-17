import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Task35Screen1()));

class Task35Screen1 extends StatefulWidget {
  const Task35Screen1({super.key});

  @override
  State<Task35Screen1> createState() => _Task35Screen1State();
}

class _Task35Screen1State extends State<Task35Screen1> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 3.5: Counter Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value: $_counter', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final int? updatedValue = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditorScreen(initialValue: _counter),
                  ),
                );
                if (updatedValue != null) {
                  setState(() {
                    _counter = updatedValue;
                  });
                }
              },
              child: const Text('Edit Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditorScreen extends StatefulWidget {
  final int initialValue;
  const EditorScreen({super.key, required this.initialValue});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editor Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => setState(() => _currentValue--),
                ),
                Text('$_currentValue', style: const TextStyle(fontSize: 32)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => _currentValue++),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, _currentValue),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}