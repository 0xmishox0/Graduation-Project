// import 'package:do_medical/doctor/appointments.dart';
// import 'package:do_medical/doctor/drawer_doc.dart';
// import 'package:do_medical/doctor/patient.dart';
// import 'package:do_medical/doctor/roshita.dart';
import 'package:do_medical/screens/doctor/home/appointments.dart';
import 'package:do_medical/screens/doctor/home/drawer_doc.dart';
import 'package:do_medical/screens/doctor/home/patient.dart';
import 'package:do_medical/screens/doctor/home/roshita.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDoc(),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الجزء العلوي (Header)
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 164, 159),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مرحبًا دكتور!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'كيف يمكننا مساعدتك اليوم؟',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // محتوى الصفحة
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الإجراءات السريعة
                  Text(
                    'الإجراءات السريعة',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickActionCard(
                        icon: Icons.receipt_long,
                        label: 'الروشتات',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Roshita()));
                        },
                      ),
                      _buildQuickActionCard(
                        icon: Icons.people,
                        label: 'المرضى',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Patient()));
                        },
                      ),
                      _buildQuickActionCard(
                        icon: Icons.calendar_today,
                        label: 'المواعيد',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Appointments()));
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // المواعيد القادمة
                  Text(
                    'المواعيد القادمة',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildAppointmentCard(
                      'محمد علي', '10:00 صباحًا', 'فحص ضغط الدم'),
                  _buildAppointmentCard(
                      'سارة يوسف', '11:30 صباحًا', 'متابعة السكر'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // بطاقة الإجراءات السريعة
  Widget _buildQuickActionCard(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Color.fromARGB(255, 2, 164, 159)),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // بطاقة الموعد
  Widget _buildAppointmentCard(String name, String time, String condition) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 2, 164, 159),
          child: Icon(Icons.person, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$time - $condition'),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 16, color: Color.fromARGB(255, 2, 164, 159)),
      ),
    );
  }
}
