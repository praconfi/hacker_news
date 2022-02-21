import 'package:flutter/material.dart';
import 'package:hacker_news/provider/news_data_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  static const id = "/detail_screen";
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  initState() {
    super.initState();

    final viewModel = context.read<NewsDataProvider>();
    viewModel.getNews(viewModel.selectedNewsId);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("News Detaiil")
      ),
      body: Consumer<NewsDataProvider>(
        builder: (context, newsProvider, child) {
          if(newsProvider.selectedNews == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("id: "+newsProvider.selectedNews!.id.toString()),
              Text("title: "+newsProvider.selectedNews!.title.toString()),
              Text("type: "+newsProvider.selectedNews!.type.toString()),
            ],
          );
        },
      ),
    );
  }
}


