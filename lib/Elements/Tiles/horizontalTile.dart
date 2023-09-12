import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalTile extends StatelessWidget {
  final int id;
  final String imagePath;
  final String categoryimagePath;
  final String category;
  final String title;
  final String date;
  final String todate;
  final String time;
  final String joined;
  final Function callBack;

  const HorizontalTile({
    super.key,
    required this.imagePath,
    required this.categoryimagePath,
    required this.category,
    required this.title,
    required this.date,
    required this.todate,
    required this.time,
    required this.joined,
    required this.callBack,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              callBack();
            },
            child: Container(
              width: 165,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 99 / 98,
                          child: Image.network(imagePath, fit: BoxFit.cover),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Visibility(
                            visible: category.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 20),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: const Color(0xff00B191),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        //Image.network(categoryimagePath),
                                        const SizedBox(width: 3),
                                        Center(
                                          child: Text(
                                            category,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Visibility(
                            visible: joined.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 20),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                  //width: 160,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: const Color(0xff00B191),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        Image.asset('images/users1.png'),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Text(
                                            '$joined người tham gia',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //width: 170,
                      //height: 300,
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset('images/calendar1.png'),
                                const SizedBox(width: 3),
                                Text(
                                  'Từ $date đến $todate',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff9B9B9B),
                                  ),
                                ),
                              ],
                            ),
                            const Flexible(child: SizedBox(height: 10)),
                            Visibility(
                              visible: time.isNotEmpty,
                              child: Row(
                                children: [
                                  Image.asset('images/clock1.png'),
                                  const SizedBox(width: 3),
                                  Text(
                                    '$time phút',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff9B9B9B),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
