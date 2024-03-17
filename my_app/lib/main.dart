import 'package:flutter/material.dart';

import 'package:my_app/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Exercise 4',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text("Exercise 4")),
          body: Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            // color: Colors.amber,
            child: const Center(
              child: FormSample(),
            ),
          ),
        ));
  }
}
