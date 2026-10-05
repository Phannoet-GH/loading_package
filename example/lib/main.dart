import 'package:flutter/material.dart';
import 'package:loading_package/loading_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Package Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Package Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading) ...[
                const LoadingIndicator(
                  size: 50.0,
                  color: Colors.deepPurple,
                  strokeWidth: 4.0,
                  message: 'Loading data, please wait...',
                ),
                const SizedBox(height: 32),
              ] else ...[
                const Text(
                  'Content is ready! Tap below to simulate loading.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
              ],
              ElevatedButton.icon(
                onPressed: _toggleLoading,
                icon: Icon(_isLoading ? Icons.stop : Icons.play_arrow),
                label: Text(_isLoading ? 'Stop Loading' : 'Start Loading'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
