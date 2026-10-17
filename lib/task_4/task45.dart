import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
      '/rate': (context) => const RateScreen(),
    },
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String movieTitle = 'Inception';
  int? _rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 4.5: Movie Rating')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _rating == null
                  ? '$movieTitle: Not rated yet'
                  : '$movieTitle: $_rating/5',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final rating = await Navigator.pushNamed<int>(
                  context,
                  '/rate',
                  arguments: movieTitle,
                );
                if (rating != null) {
                  setState(() {
                    _rating = rating;
                  });
                }
              },
              child: const Text('Rate Movie'),
            ),
          ],
        ),
      ),
    );
  }
}

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieTitle = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Rate $movieTitle')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final starNumber = index + 1;
            return IconButton(
              icon: const Icon(Icons.star, color: Colors.amber, size: 36),
              onPressed: () {
                Navigator.pop(context, starNumber);
              },
            );
          }),
        ),
      ),
    );
  }
}