import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('login');
            },
          )
        ],
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}
