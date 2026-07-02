import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Open dialer with number
              const channel = MethodChannel('com.example.hello_world/phone');
              channel.invokeMethod('callNumber', {'number': '+1234567890'});
            },
            child: const Text('Call +1234567890'),
          ),
        ),
      ),
    );
  }
}
