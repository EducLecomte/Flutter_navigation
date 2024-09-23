import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
        Navigator.pop(context, false);
        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Ecran 2 - ScaffoldMessenger',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 25)),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                    content: const Text("Message de MaterialBanner"),
                    actions: <Widget>[
                      TextButton(
                          child: const Text('Ok!'),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                          }),
                    ],
                  ));
                },
                child: const Text("MaterialBanner"),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) => Colors.lightGreenAccent),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Message de SnackBar !"),
                  ));
                },
                child: const Text("SnackBar"),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) => Colors.greenAccent),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("go ecran 1"),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) => Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
