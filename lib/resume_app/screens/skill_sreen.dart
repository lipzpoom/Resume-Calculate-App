import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  List<dynamic> skillList = [
    {
      'skill_name': 'ซ่อมคอมพิวเตอร์,โน็ตบุ๊ค',
      'skill_percent': '0.8',
      'skill_percentname': '80',
    },
    {
      'skill_name': 'WebDevelop',
      'skill_percent': '0.4',
      'skill_percentname': '40'
    },
    {
      'skill_name': 'AppDevelop',
      'skill_percent': '0.2',
      'skill_percentname': '20'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          primary: true,
          child: Stack(
            children: [
              Image.asset('assets/images/coding.jpg'),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
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
                    const Padding(padding: EdgeInsets.all(5.0)),
                    const Text(
                      'ทักษะ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: skillList.length,
                      itemBuilder: (context, index) {
                        double skillPercent = double.parse(
                          skillList[index]['skill_percent'].toString(),
                        );
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          elevation: 7.0,
                          child: CircularPercentIndicator(
                            radius: 62.0,
                            lineWidth: 10.0,
                            animation: true,
                            percent: skillPercent,
                            center: Text(
                              skillList[index]['skill_percentname'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            footer: Text(
                              skillList[index]['skill_name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.blueAccent,
                          ),
                        );
                      },
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
