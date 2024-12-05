// import 'package:do_medical/donation.dart';
import 'package:do_medical/screens/patient/drawer/donation.dart';
import 'package:flutter/material.dart';

class Drawerswap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // الجزء اللي فوق
          const UserAccountsDrawerHeader(
            accountName: Text('محمود عصام'),
            accountEmail: Text('misho@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person,
                  size: 50, color: Color.fromARGB(255, 2, 164, 159)),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 164, 159),
            ),
          ),
          // العناصر اللي في النص
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('الصفحة الرئيسية'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('الإشعارات'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.accessible),
            title: const Text('ذوي الاحتباجات الخاصه'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.volunteer_activism),
            title: const Text('التبرع'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Donation()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('الإعدادات'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('تسجيل الخروج'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
