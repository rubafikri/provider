import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_gsg/pages/HomePage.dart';
import 'package:state_managment_gsg/providers/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<provider>(
      create: (context) => provider(),
      child: MaterialApp(
        home: HomePage(),
      )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            Provider.of<provider>(context).name,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<provider>(context, listen: false).changeName('Rana');
            },
            child: Text('Get Provider Data'),
          ),
        ],
      ),
    );
  }
}
