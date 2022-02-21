import 'package:flutter/material.dart';
import 'package:hacker_news/provider/news_data_provider.dart';
import 'package:hacker_news/screens/detail_screen.dart';
import 'package:hacker_news/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsDataProvider())
      ],
      child: MaterialApp(
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          DetailScreen.id: (context) => DetailScreen(),
        },
      ),
    );
  }
}