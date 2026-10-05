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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Example'),
          centerTitle: true,
        ),
        body: const Center(
          child: LoadingIndicator(
            message: 'Loading data...',
          ),
        ),
      ),
    );
  }
}
