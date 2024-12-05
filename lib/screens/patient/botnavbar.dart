// ignore: file_names
// import 'package:do_medical/screens/home.dart';
import 'package:do_medical/screens/futurefour.dart';
import 'package:do_medical/screens/patient/future_five/smartwatch.dart';
import 'package:do_medical/screens/patient/future_three/addreminder.dart';
import 'package:do_medical/screens/patient/future_two/advice.dart';
import 'package:do_medical/screens/patient/home.dart';
// import 'package:do_medical/screens/smartwatch.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:do_medical/screens/AddReminder.dart';
// import 'package:do_medical/screens/advice.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeDoc(),
    Advice(),
    MedicationReminderPage(),
    const section(),
    SmartWatch(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 2, 164, 159),
        color: const Color.fromRGBO(255, 255, 255, 0.541),
        items: const [
          TabItem(icon: Icons.home, title: "الرئيسية"),
          TabItem(icon: Icons.lightbulb, title: "نصائح"),
          TabItem(icon: Icons.add, title: "إضافة"),
          TabItem(icon: Icons.monitor_heart_sharp, title: "القياس"),
          TabItem(icon: Icons.watch, title: "الربط"),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
