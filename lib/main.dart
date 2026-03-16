import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Hello World !!!");
  }
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  var _name = "";
  final _greetStyle = const TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Hello $_name", style: _greetStyle),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text("!!!!", style: _greetStyle),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => setState(() {
              _name = value;
            }),
            style: TextStyle(color: const Color.fromARGB(255, 202, 22, 226)),
          ),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Greet(),
    );
  }
}
