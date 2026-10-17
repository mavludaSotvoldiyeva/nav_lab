import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(home: FirstScreen()));
class BackOrExitButton extends StatelessWidget {
  const BackOrExitButton({super.key});
  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    return ElevatedButton(
      onPressed: canPop ? () => Navigator.pop(context) : null,
      child: Text(canPop ? 'Back' : 'Nothing to go back to'),
    );
  }
}
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Disabled on root screen because canPop is false
            const BackOrExitButton(),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Push Next Screen'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SecondScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: const Center(
        // Enabled on pushed screen because canPop is true
        child: BackOrExitButton(),
      ),
    );
  }
}