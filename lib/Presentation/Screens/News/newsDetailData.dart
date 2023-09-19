class NewsDetailData {
  final String title;
  final String date;
  final List<String> categories;
  final String content;
  final int id;

  const NewsDetailData(
      {required this.title,
      required this.date,
      required this.categories,
      required this.content,
      required this.id});
}
