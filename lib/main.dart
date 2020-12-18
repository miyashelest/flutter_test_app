import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: 'Flutter Test Task',
            ),
        '/second': (context) => MySecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color defColor = Colors.yellow;
  Random random = Random();

  Color colorRandom() {
    List colors = [
      Colors.cyan,
      Colors.green,
      Colors.grey,
      Colors.blue,
      Colors.amber,
      Colors.deepOrange,
      Colors.red,
      Colors.indigo
    ];

    setState(() {
      defColor = colors[random.nextInt(colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment(0.0, 0.0),
                    color: defColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Hey there!',
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/second');
                          },
                          child: const Text('Show more',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    colorRandom();
                    Toast.show("Clicked", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                  },
                ),
              ),
            ]),
      ),
    );
  }
}

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                  child: Container(
                    alignment: Alignment(0.0, 0.0),
                    color: Colors.lightGreen,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Have a nice day!',
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text('Go Back',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                ),
            ]),
      ),
    );
  }
}
