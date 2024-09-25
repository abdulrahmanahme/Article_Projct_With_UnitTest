import 'package:artical/core/services_locator/services_locator.dart';
import 'package:artical/feature/artical/presentation/screens/article_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServicesLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ArticleScreen(),
    );
  }
}

