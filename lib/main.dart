import 'package:flutter/material.dart';
import 'graph_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:AppHomePage(title: 'Flutter ECG (BLoC) Drawer'),
    );
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(title, style: const TextStyle(
          color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic)),
      leading: IconButton(
        icon: const Icon(Icons.monitor_heart_outlined, color: Colors.white), // Icon widget
        onPressed: () {
          // Add your onPressed logic here
        },
      ),
      backgroundColor: Colors.lightBlue,
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              GraphWidget(
                samplesNumber: 200,
                width: 340,
                height: 100,
              ),
              const SizedBox(height: 16.0),
              GraphWidget(
                samplesNumber: 128,
                width: 340,
                height: 100,
              ),
              const SizedBox(height: 16.0),
              GraphWidget(
                samplesNumber: 250,
                width: 340,
                height: 100,
              ),
              const SizedBox(height: 16.0),
              GraphWidget(
                samplesNumber: 300,
                width: 340,
                height: 100,
              ),
              const SizedBox(height: 16.0),
              GraphWidget(
                samplesNumber: 180,
                width: 340,
                height: 100,
              ),
              const SizedBox(height: 16.0),
              GraphWidget(
                samplesNumber: 220,
                width: 340,
                height: 100,
              ),
              const SizedBox(height: 16.0),
              GraphWidget(
                samplesNumber: 350,
                width: 340,
                height: 100,
              ),
              const SizedBox(height: 16.0),
              GraphWidget(
                samplesNumber: 240,
                width: 340,
                height: 100,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

