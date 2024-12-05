import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final List persons = [
    'ahmed',
    'mahmoud',
    'misho'
        'osama'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView.builder(
          itemCount: persons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.yellow,
                ),
                height: 50,
                width: 150,
                child: Text(
                  persons[index],
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
