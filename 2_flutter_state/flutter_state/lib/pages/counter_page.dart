import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // Variable
  int _counter = 0;
  // Method
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  // UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You pushed the buttom this many times:"),
            Text(
              _counter.toString(),
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: _incrementCounter, child: Text("Push me!"))
          ],
        ),
      ),
    );
  }
}
