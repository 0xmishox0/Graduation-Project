// import 'package:do_medical/screens/buttonsnav.dart';
// import 'package:do_medical/screens/notification.dart';
// import 'package:do_medical/screens/notificationpopup.dart';
// import 'package:do_medical/screens/specialties_page.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:do_medical/screens/drawerswap.dart';
// import 'package:do_medical/screens/viewall.dart';
// import 'package:do_medical/section_doctors/profile_doc1.dart';
// import 'package:do_medical/section_doctors/sec_asnan.dart';
// import 'package:do_medical/section_doctors/sec_eyes.dart';
// import 'package:do_medical/section_doctors/sec_heart.dart';
// import 'package:do_medical/section_doctors/sec_maind.dart';
import 'package:do_medical/screens/patient/drawer/drawerswap.dart';
import 'package:do_medical/screens/patient/section_doctors/sec_asnan.dart';
import 'package:do_medical/screens/patient/section_doctors/sec_eyes.dart';
import 'package:do_medical/screens/patient/section_doctors/sec_heart.dart';
import 'package:do_medical/screens/patient/section_doctors/sec_maind.dart';
import 'package:do_medical/screens/patient/the_best/profile_doc1.dart';
import 'package:do_medical/screens/patient/viewall.dart';
import 'package:flutter/material.dart';

class HomeDoc extends StatefulWidget {
  const HomeDoc({super.key});

  @override
  State<HomeDoc> createState() => _HomeDocState();
}

class _HomeDocState extends State<HomeDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0E0E6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 35,
                    child: Image.asset(
                      'assets/user.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'مرحباً بك,\n محمود عصام',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawerswap(), // سحب الشاشة الى اليسار
      body: ListView(children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    // width: 330,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'البحث',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                // ايقونة الفلتر
                Container(
                  // padding: EdgeInsets.all(22),
                  margin: const EdgeInsets.only(left: 5),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/filter.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Viewall()),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            // قسم التخصصات
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'التخصصات',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Viewall()),
                      );
                    },
                    child: const Text(
                      'مشاهدة الكل',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //  سركول عرضي الخاص بقسم التخصصات
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // بداية التخصصات
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    height: 180,
                    width: 125,
                    decoration: const BoxDecoration(
                      color: Color(0xFF02A49F),
                      image: DecorationImage(
                        image: AssetImage('assets/clean.png'),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DentistsPage(),
                            ));
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'أسنان',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 180,
                    width: 125,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 2, 164, 159),
                      image: DecorationImage(
                        image: AssetImage('assets/eye-care.png'),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SecEyes()));
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'عيون',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 180,
                    width: 125,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 2, 164, 159),
                      image: DecorationImage(
                        image: AssetImage('assets/brain.png'),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecMaind()));
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'مخ وأعصاب',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 180,
                    width: 125,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 2, 164, 159),
                      image: DecorationImage(
                        image: AssetImage('assets/cardiologist.png'),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecHeart()));
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'قلب',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), // نهاية السكرول الافقي

            const SizedBox(
              height: 15,
            ),
            //بداية قسم افضل الدكاتره
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'أفضل الدكاتره',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'مشاهدة الكل',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            // سكرول افضل الدكاتره
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 5),
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 2, 164, 159),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorProfile()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'د. محمد ممدوح',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'طبيب أسنان',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/doctor.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 5),
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 2, 164, 159),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'د. سلمى محمد',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'طبيبة عيون',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/nurse.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
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
      ]),
    );
  }
}
