// ignore_for_file: camel_case_types

// import 'package:do_medical/screens/future/pagefoure.dart';
// import 'package:do_medical/screens/future/pageone.dart';
// import 'package:do_medical/screens/future/pagethree.dart';
// import 'package:do_medical/screens/future/pagetwo.dart';
import 'package:do_medical/screens/patient/future_four/pagefoure.dart';
import 'package:do_medical/screens/patient/future_four/pageone.dart';
import 'package:do_medical/screens/patient/future_four/pagethree.dart';
import 'package:do_medical/screens/patient/future_four/pagetwo.dart';
import 'package:flutter/material.dart';

class section extends StatefulWidget {
  const section({super.key});

  @override
  State<section> createState() => _sectionState();
}

class _sectionState extends State<section> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('متابعة القياسات الحيوية',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 2, 164, 159),
      ),
      backgroundColor: Colors.teal[50],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // ده الكولم بتاع الصف الأول
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer(
                    context,
                    "ضغط الدم",
                    Icons.favorite,
                    Colors.red[600]!,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BloodPressurePage()),
                    ),
                  ),
                  buildContainer(
                    context,
                    "معدل ضربات القلب",
                    Icons.favorite_border,
                    Colors.blue[600]!,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HeartRatePage()),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // باخد مسافه بين الصفين بسايز بوكس
            Expanded(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, //   عشان يبقوا شكلهم متساوي
                children: [
                  buildContainer(
                    context,
                    "مستوى السكر",
                    Icons.water_drop,
                    Colors.orange[600]!,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BloodSugarPage()),
                    ),
                  ),
                  buildContainer(
                    context,
                    "الوزن والطول",
                    Icons.accessibility,
                    Colors.green[600]!,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeightHeightPage()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.9), color.withOpacity(0.5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //  ده الضل
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 5), // ظل تحت
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 90, color: Colors.white), //  اعدادت الايقونه
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
