import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Not Needed First Page has App Bar
      // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      body: Center(
        child: Text("HOME PAGE"),
      ),
    );
  }
}
