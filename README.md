

A simple animated  menu list for Flutter, Adjustable radius, colors, text size, Icons and background color.

## Features

![a.gif](doc%2Fa.gif)

![b.jpg](doc%2Fb.jpg)


## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

import 'package:flutter/material.dart';
import 'package:fancy_menu/fancy_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
              color: Colors.red,
              child: Listener(
                  onPointerUp: (PointerUpEvent event) async {
                    final List<Map<String, dynamic>> menuItemsList = [
                      {
                        'value': 1,
                        'iconPath': const Icon(Icons.open_in_browser),
                        'text': 'Item 1',
                      },
                      {
                        'value': 2,
                        'iconPath': const Icon(Icons.accessibility),
                        'text': 'Item 2',
                      },
                      {
                        'value': 3,
                        'iconPath': const Icon(Icons.account_balance_wallet_rounded),
                        'text': 'Item 3',
                      },
                      // Add more items in a similar format
                    ];
                    final selectedValue = await fancy_menu(context:context,menuItemsList:  menuItemsList,position: event.position).showPopupMenu();
                    if (selectedValue != null) {
                      print(selectedValue.toString());
                    }

                    //  fancy_menu.(context: context, position: event.position, items: []);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Show Menu'),
                  ))),
        ));
  }
}


# fancy_menu
