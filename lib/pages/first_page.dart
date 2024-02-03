// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      drawer: Drawer(),
      body: Center(
          child: ElevatedButton(
        child: Text('Go to Second Page'),
        onPressed: () {
          Navigator.pushNamed(context, '/secondpage');
        },
      )),
    );
  }
}
