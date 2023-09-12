class ContestDetailData {
  final String imagePath;
  final String joined;
  final String title;
  final String date;
  final String toDate;
  final String unit;
  final int finishCondition;
  final String content;
  final int questNum;
  final String occurTime;
  final int id;
  final String status;

  const ContestDetailData(
      {required this.imagePath,
      required this.joined,
      required this.title,
      required this.date,
      required this.toDate,
      required this.unit,
      required this.finishCondition,
      required this.content,
      required this.questNum,
      required this.id,
      required this.occurTime,
      required this.status});
}
