import 'package:flutter/material.dart';
import 'package:hacker_news/screens/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:hacker_news/provider/news_data_provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<NewsDataProvider>(
      builder: (context, viewModel, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final newsId = viewModel.newsList[index];
            return ListTile(
              title: Text(newsId.toString()),
              onTap: () {
                viewModel.setSelectedNewsId(newsId);
                Navigator.pushNamed(context, DetailScreen.id);
              },
            );
          },
          itemCount: viewModel.newsCount,
        );
      },
    );
  }
}