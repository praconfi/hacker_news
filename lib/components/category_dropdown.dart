import 'package:flutter/material.dart';
import 'package:hacker_news/provider/news_data_provider.dart';
import 'package:provider/provider.dart';

class CategoryDropdown extends StatefulWidget {

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NewsDataProvider>();

    return (
        DropdownButton<String>(
          value: viewModel.selectedCategory,
          icon: const Icon(Icons.arrow_downward),
          onChanged: (String? newValue) {
            viewModel.getNewsList(newValue);
          },
          items: viewModel.categories
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }
}
