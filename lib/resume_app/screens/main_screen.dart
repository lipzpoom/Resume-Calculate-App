import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainSreenState();
}

class _MainSreenState extends State<MainScreen> {
  List<dynamic> education = [
    {
      'edu_level': 'ปริญญาตรี',
      'edu_since': '2564-กำลังศึกษา',
      'edu_school': 'มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา',
    },
    {
      'edu_level': 'ประกาศนียบัตรวิชาชีพชั้นสูง',
      'edu_since': '2562-2564',
      'edu_school': 'วิทยาลัยเทคนิดแพร่',
    },
    {
      'edu_level': 'ประกาศนียบัตรวิชาชีพ',
      'edu_since': '2560-2562',
      'edu_school': 'วิทยาลัยเทคนิคแพร่',
    },
    {
      'edu_level': 'มัธยมศึกษา',
      'edu_since': '2557-2560',
      'edu_school': 'โรงเรียนพิริยาลัยจังหวัดแพร่',
    },
    {
      'edu_level': 'ประถมศึกษา',
      'edu_since': '2551-2557',
      'edu_school': 'โรงเรียนวัดต้นไคร้',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      // debugShowCheckedModeBanner: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  spreadRadius: 3,
                                  blurRadius: 100,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/profile.jpg'),
                              radius: 80.0,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 181, 181, 181),
                                  spreadRadius: 0.1,
                                  blurRadius: 150,
                                ),
                              ],
                            ),
                            child: Column(
                              children: const [
                                Text(
                                  'Nadtapoom Kantee',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                Text(
                                  'POOM',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Text(
                              'ข้อมูลส่วนตัว',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),
                            Row(
                              children: const [
                                Text('ชื่อ: '),
                                Text('ณัฐภูมิ ขันตี'),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('ชื่อเล่น: '),
                                Text('ภูมิ'),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('เพศ: '),
                                Text('ชาย'),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('วัน/เดือน/ปี เกิด: '),
                                Text('21 กุมภาพันธ์ 2544'),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('สัญชาติ: '),
                                Text('ไทย'),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('ศาสนา: '),
                                Text('พุทธ'),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('เกรดเฉลี่ยสะสม (GPA): '),
                                Text(
                                  '3.65',
                                  style: TextStyle(height: 1.5),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            const Text(
                              'การศึกษา',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: education.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(education[index]['edu_level'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17)),
                                            const Divider(
                                              thickness: 0.5,
                                              color: Colors.black,
                                            ),
                                            Text(education[index]['edu_school'],
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                            Text(education[index]['edu_since'],
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
