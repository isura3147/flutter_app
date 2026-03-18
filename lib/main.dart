import 'package:coffemasters_flutter/datamanager.dart';
import 'package:coffemasters_flutter/pages/offerspage.dart';
import 'package:coffemasters_flutter/pages/orderspage.dart';
import 'package:coffemasters_flutter/pages/menupage.dart';
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
                child: Text("!", style: _greetStyle),
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
      title: 'Coffee Masters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        appBarTheme: AppBarTheme(backgroundColor: Colors.brown.shade600),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataManager dataManager = DataManager();
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = Text("This is a widget");

    switch (_selectedIndex) {
      case 0:
        currentWidgetPage = MenuPage(dataManager: dataManager);
        break;
      case 1:
        currentWidgetPage = Offerspage();
        break;
      case 2:
        currentWidgetPage = OrdersPage(dataManager: dataManager);
        break;
      default:
    }

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Image.asset("images/logo.png")),
      body: currentWidgetPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        backgroundColor: Colors.brown.shade600,
        selectedItemColor: Colors.yellow[400],
        unselectedItemColor: Colors.brown[50],
        items: [
          BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
          BottomNavigationBarItem(
            label: "Offers",
            icon: Icon(Icons.local_offer),
          ),
          BottomNavigationBarItem(
            label: "Order",
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
