class CampaignDetailData {
  final String imagePath;
  final String category;
  final String title;
  final String postedDate;
  final String date;
  final String toDate;
  final String occurTime;
  final String location;
  final String BenefitedSubject;
  final String content;
  final String phone;
  final String email;
  final String status;
  final List<String> imagesUrls;
  final int id;

  const CampaignDetailData({
    required this.imagePath,
    required this.category,
    required this.title,
    required this.postedDate,
    required this.date,
    required this.toDate,
    required this.occurTime,
    required this.location,
    required this.BenefitedSubject,
    required this.content,
    required this.phone,
    required this.email,
    required this.status,
    required this.imagesUrls,
    required this.id,
  });
}
