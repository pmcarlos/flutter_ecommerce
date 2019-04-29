import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/login_page.dart';
import 'package:flutter_ecommerce/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-commerce',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage()
      },
      theme: ThemeData(
        primaryColor: Colors.cyan[400],
        accentColor: Colors.deepOrange[200],
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: RegisterPage(),
    );
  }
}
