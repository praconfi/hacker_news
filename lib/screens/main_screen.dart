import 'package:flutter/material.dart';
import 'package:hacker_news/provider/news_data_provider.dart';
import 'package:hacker_news/components/category_dropdown.dart';
import 'package:hacker_news/components/news_list.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const id = "/";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  initState() {
    super.initState();

    final viewModel = context.read<NewsDataProvider>();
    viewModel.getNewsList(viewModel.selectedCategory);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CategoryDropdown(),
          Expanded(child: NewsList())
        ],
      ),
    );
  }
}





