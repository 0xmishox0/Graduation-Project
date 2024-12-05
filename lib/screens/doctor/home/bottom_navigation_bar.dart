// import 'package:do_medical/doctor/appointments.dart';
// import 'package:do_medical/doctor/home_page.dart';
// import 'package:do_medical/doctor/patient.dart';
// import 'package:do_medical/doctor/tools.dart';
import 'package:do_medical/screens/doctor/home/appointments.dart';
import 'package:do_medical/screens/doctor/home/home_page.dart';
import 'package:do_medical/screens/doctor/home/patient.dart';
import 'package:do_medical/screens/doctor/home/tools.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Doctor_home extends StatefulWidget {
  @override
  _Doctor_homeState createState() => _Doctor_homeState();
}

class _Doctor_homeState extends State<Doctor_home> {
  int _currentIndex = 0;

  // قائمة الصفحات
  final List<Widget> _pages = [
    HomePage(),
    Appointments(),
    Patient(),
    Tools(),
    // ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color.fromARGB(255, 2, 164, 159),
        items: [
          TabItem(icon: Icons.home, title: 'الرئيسية'),
          TabItem(icon: Icons.calendar_today, title: 'المواعيد'),
          TabItem(icon: Icons.person, title: 'المرضى'),
          TabItem(icon: Icons.medical_services, title: 'الأدوات'),
        ],
        initialActiveIndex: 0,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
