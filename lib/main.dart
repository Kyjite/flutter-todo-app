import 'package:flutter/material.dart';
import 'package:to_do_list_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
        ),
        scaffoldBackgroundColor: Colors.yellow[100]
      ),
      home: HomePage(),
    );
  }
}
