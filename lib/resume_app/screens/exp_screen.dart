import 'package:flutter/material.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  List<Map<String, dynamic>> education = [
    {
      'exp_location': 'ร้านคอมพิวเตอร์P-power',
      'exp_job': 'ตำแหน่ง: ช่างซ่อม',
      'exp_img': 'assets/images/ppower.png',
    },
    {
      'exp_location': 'โรงพยาบาลสันกำแพง',
      'exp_job': 'ตำแหน่ง: IT Support,Web Developer',
      'exp_img': 'assets/images/hospital.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: education.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(top: 30.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20.0,
                              spreadRadius: 0.1,
                              offset: Offset(0, 12))
                        ]),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(education[index]['exp_img']),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(education[index]['exp_location'],
                        style: const TextStyle(fontSize: 20)),
                    Text(education[index]['exp_job'],
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
