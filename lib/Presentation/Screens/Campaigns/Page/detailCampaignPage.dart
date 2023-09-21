import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:thanh_nien_da_nang/Data/Campaigns/campaignDetailData.dart';

class DetailCampaignPage extends StatefulWidget {
  final int id;
  final CampaignDetailData campaignData;

  const DetailCampaignPage({
    Key? key,
    required this.campaignData,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailCampaignPage> createState() => _DetailCampaignPageState();
}

class _DetailCampaignPageState extends State<DetailCampaignPage> {
  bool _showMoreText = false;

  @override
  Widget build(BuildContext context) {
    final campaignData = widget.campaignData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Chi tiết đợt tình nguyện',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xff1F1F1F),
          ),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  campaignData.imagePath,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff00B191),
                              ),
                              child: Row(
                                children: [
                                  Image.asset('images/blood-donation1.png'),
                                  const SizedBox(width: 5),
                                  Text(
                                    campaignData.category,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff0269E9),
                              ),
                              child: Text(
                                campaignData.status,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          campaignData.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset('images/calendar1.png'),
                          const SizedBox(width: 5),
                          Text(
                            'Đăng vào ${campaignData.postedDate}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8A8A8A),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/calendarblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Thời gian đăng ký',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Tu ${campaignData.date} den ${campaignData.toDate}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Color(0xffDDDDDD),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/calendarblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Thời gian diễn ra',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              campaignData.occurTime,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Color(0xffDDDDDD),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/mapblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Địa điểm',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              campaignData.location,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Color(0xffDDDDDD),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/usersblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Đối tượng thụ hưởng',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              campaignData.BenefitedSubject,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Color(0xffDDDDDD),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/pollblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Nội dung',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  campaignData.content,
                                  maxLines: _showMoreText ? null : 3,
                                  overflow:
                                      _showMoreText ? null : TextOverflow.clip,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _showMoreText = !_showMoreText;
                                  });
                                },
                                child: Column(
                                  children: [
                                    const SizedBox(height: 3),
                                    Text(
                                      _showMoreText ? 'Thu gọn' : 'Xem thêm',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff005CE7),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Color(0xffDDDDDD),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/pictureblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Hình ảnh & tài liệu đính kèm',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Hình ảnh',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 8,
                    children: widget.campaignData.imagesUrls.map((index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          index,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Text('Image not available');
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Divider(
                        color: Color(0xffDDDDDD),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/phoneblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Thông tin liên hệ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                const Text(
                                  'Số điện thoại: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    campaignData.phone,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0269E9),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email: ${campaignData.email}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
