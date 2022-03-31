import 'package:flutter/material.dart';
import 'package:lifeline_system/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Line',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const NewsPage(),
    );
  }
}
