import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Task34Screen1()));

class Task34Screen1 extends StatefulWidget {
  const Task34Screen1({super.key});

  @override
  State<Task34Screen1> createState() => _Task34Screen1State();
}

class _Task34Screen1State extends State<Task34Screen1> {
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 3.4: Pick a Colour')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              color: _currentColor,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final Color? selectedColor = await Navigator.push<Color>(
                  context,
                  MaterialPageRoute(builder: (context) => const Task34Screen2()),
                );
                if (selectedColor != null) {
                  setState(() {
                    _currentColor = selectedColor;
                  });
                }
              },
              child: const Text('Choose colour'),
            ),
          ],
        ),
      ),
    );
  }
}

class Task34Screen2 extends StatelessWidget {
  const Task34Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Colour')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(context, Colors.red),
              child: const Text('Red', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => Navigator.pop(context, Colors.green),
              child: const Text('Green', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => Navigator.pop(context, Colors.blue),
              child: const Text('Blue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}