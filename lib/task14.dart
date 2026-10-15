import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(home: StepScreen(step: 1)));
class StepScreen extends StatelessWidget {
  final int step;
  const StepScreen({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step $step')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are on Step $step', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            if (step < 4)
              ElevatedButton(
                child: const Text('Next Step'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => StepScreen(step: step + 1)),
                ),
              )
            else
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Finish (Back to Step 1)', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
          ],
        ),
      ),
    );
  }
}