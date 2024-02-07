import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // text edition controller to get access to what the user typed
  TextEditingController myController = TextEditingController();

  String greetingMessage = "";

  void _greetUser() {
    String userName = myController.text;

    setState(() {
      greetingMessage = "Hello, " + userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(greetingMessage),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type Text Here',
              ),
            ),
            ElevatedButton(onPressed: _greetUser, child: Text("Tap Me"))
          ],
        ),
      ),
    ));
  }
}
