import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  // قائمة المواعيد
  final List<Map<String, String>> appointments = [
    {
      "patientName": "محمد علي",
      "date": "2024-12-05",
      "time": "10:00 صباحًا",
      "status": "قيد الانتظار",
    },
    {
      "patientName": "سلمى أحمد",
      "date": "2024-12-05",
      "time": "11:30 صباحًا",
      "status": "تم",
    },
    {
      "patientName": "يوسف خالد",
      "date": "2024-12-06",
      "time": "9:00 صباحًا",
      "status": "ملغى",
    },
    {
      "patientName": "نور محمود",
      "date": "2024-12-06",
      "time": "12:00 مساءً",
      "status": "قيد الانتظار",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان الصفحة
              Center(
                child: Text(
                  "قسم المواعيد",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 164, 159),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // قائمة المواعيد
              Expanded(
                child: ListView.builder(
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    return _buildAppointmentCard(context, appointments[index]);
                  },
                ),
              ),

              // زر إضافة موعد جديد
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _addNewAppointment(context);
                  },
                  icon: Icon(Icons.calendar_today),
                  label: Text("إضافة موعد جديد"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // تصميم بطاقة الموعد
  Widget _buildAppointmentCard(
      BuildContext context, Map<String, String> appointment) {
    Color statusColor;

    // تحديد لون الحالة
    switch (appointment["status"]) {
      case "قيد الانتظار":
        statusColor = Colors.orange;
        break;
      case "تم":
        statusColor = Colors.green;
        break;
      case "ملغى":
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 2, 164, 159),
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          appointment["patientName"] ?? "",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${appointment["date"]} - ${appointment["time"]}",
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            appointment["status"] ?? "",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // نافذة إضافة موعد جديد
  void _addNewAppointment(BuildContext context) {
    final patientNameController = TextEditingController();
    final dateController = TextEditingController();
    final timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text("إضافة موعد جديد"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: patientNameController,
                decoration: InputDecoration(labelText: "اسم المريض"),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: "التاريخ (YYYY-MM-DD)"),
              ),
              TextField(
                controller: timeController,
                decoration: InputDecoration(labelText: "الوقت (HH:MM)"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                // في المستقبل: يمكن إضافة البيانات إلى القائمة
                Navigator.pop(context);
              },
              child: Text("إضافة"),
            ),
          ],
        );
      },
    );
  }
}
