
class New {
  final int idnews;
  final String title;
  final String subtitle;
  final String date;
  final String img;
  final String news;
  final String source;

  const New({
    required this.idnews,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.img,
    required this.news,
    required this.source,
});

  static New fromJson(json) => New(
    idnews: json["idnews"],
    title: json["title"],
    subtitle: json["subtitle"],
    date: json["date"],
    img: json["img"],
    news: json["news"],
    source: json["source"],
  );
}