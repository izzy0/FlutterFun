// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("First Page"),
              onTap: () {
                Navigator.pushNamed(context, '/firstpage');
              },
            ),
            ListTile(
              title: Text("Second Page"),
              onTap: () {
                Navigator.pushNamed(context, '/secondpage');
              },
            )
          ],
        ),
      ),
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
