import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  final String userImageUrl;
  final String phoneNumber;
  final String name;
  final String email;

  const PersonalPage({
    Key? key,
    required this.userImageUrl,
    required this.phoneNumber,
    required this.name,
    required this.email, // Email is now required
  }) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Container(
        color: const Color(0xffFFFFFF),
        padding: const EdgeInsets.all(15),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: (widget.userImageUrl.isNotEmpty)
                    ? NetworkImage(widget.userImageUrl)
                    : const AssetImage('images/userdefault.png')
                        as ImageProvider<Object>,
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                widget.phoneNumber,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff484848),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Text(
                widget.email,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff484848),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(
                    color: Color(0xffE3E3E3),
                    width: 1,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Image.asset('images/singleuserblue.png'),
                    const SizedBox(width: 10),
                    const Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Thông tin Đoàn viên',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Xem thông tin tài khoản Đoàn viên',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(
                    color: Color(0xffE3E3E3),
                    width: 1,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    Image.asset('images/lockblue.png'),
                    const SizedBox(width: 10),
                    const Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Đổi mật khẩu',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Đổi mật khẩu đăng nhập',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Add your logic for signing out here
              },
              child: const Text(
                'Đăng xuất',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3A3A3A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
