import 'package:flutter/material.dart';
import 'package:login/provider/user_provider.dart';
import 'package:login/screen/home/home_screen.dart';
import 'package:login/screen/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'APP',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginScreen(),
          'home': (BuildContext context) => HomeScreen(),
        },
      ),
    );
  }
}
