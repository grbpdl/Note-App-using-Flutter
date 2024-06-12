import 'package:flutter/material.dart';
import 'package:note_application/widget/Card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Your Notes",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Write your Notes",
            style: TextStyle(fontSize: 50),
          ),
          centerTitle: true,
          toolbarHeight: 150,
        ),
        body: Container(
          width: double.maxFinite,
          color: Colors.blueGrey.shade600,
          child: Column(children: [
            MyCard(),
          ]),
        ),
      ),
    );
  }
}
