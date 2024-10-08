import 'package:flutter/material.dart';

import 'firstpage.dart';
import 'secondpage.dart';
import 'thirdpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      home: const FirstPage(title: 'Flutter Navigation'),
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) => FirstPage(title: 'Page 1'),
        '/route2': (BuildContext context) => SecondPage(title: 'Page 2'),
        '/route3': (BuildContext context) => ThirdPage(title: 'Page 3'),
      },
    );
  }
}
