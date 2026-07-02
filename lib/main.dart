import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestPermissionAndCall();
    });
  }

  Future<void> _requestPermissionAndCall() async {
    var status = await Permission.phone.request();
    
    if (status.isGranted) {
      _makeCall();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void _makeCall() {
    const channel = MethodChannel('com.example.hello_world/phone');
    channel.invokeMethod('callNumber', {'number': '+1234567890'});
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Requesting permission...'),
        ),
      ),
    );
  }
}
