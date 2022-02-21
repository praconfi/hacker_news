class NewsItem {
  NewsItem({
    required this.by,
    required this.descendants,
    required this.id,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });
  late final String by;
  late final int descendants;
  late final int id;
  late final List<int> kids;
  late final int score;
  late final int time;
  late final String title;
  late final String type;
  late final String url;

  NewsItem.fromJson(Map<String, dynamic> json){
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    kids = List.castFrom<dynamic, int>(json['kids']);
    score = json['score'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['by'] = by;
    _data['descendants'] = descendants;
    _data['id'] = id;
    _data['kids'] = kids;
    _data['score'] = score;
    _data['time'] = time;
    _data['title'] = title;
    _data['type'] = type;
    _data['url'] = url;
    return _data;
  }
}