import 'package:flutter/material.dart';

import '../widgets/menu.dart';

class CalculateApp extends StatefulWidget {
  const CalculateApp({super.key});
  static const routeName = '/calculate_app';

  @override
  State<CalculateApp> createState() => _CalculateAppState();
}

class _CalculateAppState extends State<CalculateApp> {
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double result = 0;
  void calculate() {
    setState(() {
      result = (double.parse(_widthController.text) /
          (double.parse(_heightController.text) /
              100 *
              double.parse(_heightController.text) /
              100));
      _widthController.text = '';
      _heightController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'โปรแกรมคำนวณดัชนีมวลกาย',
                style: TextStyle(fontSize: 25.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.0,
                    child: TextFormField(
                      controller: _widthController,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        labelText: 'น้ำหนัก',
                        hintText: 'น้ำหนัก',
                        hintStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(),
                      ).copyWith(isDense: true),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  SizedBox(
                    width: 150.0,
                    child: TextFormField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        labelText: 'ส่วนสูง',
                        hintText: 'ส่วนสูง',
                        hintStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(),
                      ).copyWith(isDense: true),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () => calculate(),
                child: const Text('คำนวณ'),
              ),
              result > 0
                  ? const Text('ค่าดัชนีมวลกายของคุณคือ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  : Container(),
              result > 0
                  ? Text('$result', style: const TextStyle(fontSize: 18))
                  : Container(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const Menu());
  }
}
