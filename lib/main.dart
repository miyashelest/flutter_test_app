import 'dart:math';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Task',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: MyHomePage(title: 'Flutter Test Task')
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
        body: Container(
          child: GestureDetector(
            child: Container(
              child: Text('Hey there!', style: Theme.of(context).textTheme.headline4),
              alignment: Alignment(0.0, 0.0),
              color: defColor,
            ),
            onTap: () {
              colorRandom();
              Toast.show("Clicked", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            },
          ),
        ));
  }
}
