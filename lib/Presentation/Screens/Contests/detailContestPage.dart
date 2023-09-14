import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Elements/Buttons/buildlogsigninBtn.dart';
import 'package:thanh_nien_da_nang/Elements/Buttons/buildreversedlogsigninBtn.dart';

import 'package:thanh_nien_da_nang/Presentation/Screens/Contests/contestDetailData.dart';

class DetailContestPage extends StatefulWidget {
  final int id;
  final ContestDetailData contestData;

  const DetailContestPage({
    Key? key,
    required this.contestData,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailContestPage> createState() => _DetailContestPageState();
}

class _DetailContestPageState extends State<DetailContestPage> {
  bool _showMoreText = false;
  List<String> imageUrls = [];

  @override
  Widget build(BuildContext context) {
    final contestData = widget.contestData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Chi tiết cuộc thi',
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
                Container(
                  child: Image.network(
                    contestData.imagePath,
                    fit: BoxFit.cover,
                  ),
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
                                  Image.asset('images/users1.png'),
                                  const SizedBox(width: 5),
                                  Text(
                                    contestData.joined.toString() +
                                        ' người tham gia',
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
                                contestData.status,
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
                          contestData.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Image.asset('images/checkgreen.png'),
                            const SizedBox(width: 5),
                            const Text(
                              'Bạn đã hoàn thành cuộc thi này',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff00B191),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('images/pollblue.png'),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'Mô tả cuộc thi',
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
                                      contestData.content,
                                      maxLines: _showMoreText ? null : 3,
                                      overflow: _showMoreText
                                          ? null
                                          : TextOverflow.clip,
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
                                          _showMoreText
                                              ? 'Thu gọn'
                                              : 'Xem thêm',
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
                          Row(
                            children: [
                              Image.asset('images/layersblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Số lượng câu hỏi',
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
                              '${contestData.questNum} câu',
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
                              Image.asset('images/badgecheckblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Điểu kiện hoàn thành',
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
                              'Trả lới đúng ít nhất ' +
                                  contestData.finishCondition.toString() +
                                  '/' +
                                  contestData.questNum.toString() +
                                  ' câu',
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
                              Image.asset('images/clockblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Thời gian làm bài',
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
                              contestData.occurTime + ' phút',
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
                              'Từ ' +
                                  contestData.date +
                                  ' đến ' +
                                  contestData.toDate,
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
                              Image.asset('images/bankblue.png'),
                              const SizedBox(width: 5),
                              const Text(
                                'Đơn vị tổ chức',
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
                              contestData.unit,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      BuildLogSignInBtn(
                          labeltext: 'Bắt đầu làm bài', callback: () {}),
                      const SizedBox(height: 20),
                      BuildReversedLogSignInBtn(
                          labeltext: 'Xem kết quả thi', callback: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
