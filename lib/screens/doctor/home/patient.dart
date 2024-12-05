import 'package:flutter/material.dart';

class Patient extends StatelessWidget {
  // قائمة المرضى
  final List<Map<String, String>> patients = [
    {"name": "محمد علي", "age": "25", "gender": "ذكر"},
    {"name": "سلمى أحمد", "age": "30", "gender": "أنثى"},
    {"name": "يوسف خالد", "age": "40", "gender": "ذكر"},
    {"name": "نور محمود", "age": "22", "gender": "أنثى"},
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
                  "قسم المرضى",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 164, 159),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // قائمة المرضى
              Expanded(
                child: ListView.builder(
                  itemCount: patients.length,
                  itemBuilder: (context, index) {
                    return _buildPatientCard(context, patients[index]);
                  },
                ),
              ),

              // زر إضافة مريض جديد
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _addNewPatient(context);
                  },
                  icon: Icon(Icons.person_add),
                  label: Text("إضافة مريض جديد"),
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

  // تصميم بطاقة المريض
  Widget _buildPatientCard(BuildContext context, Map<String, String> patient) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 2, 164, 159),
          child: Icon(
            patient["gender"] == "ذكر" ? Icons.male : Icons.female,
            color: Colors.white,
          ),
        ),
        title: Text(
          patient["name"] ?? "",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "العمر: ${patient["age"]} - الجنس: ${patient["gender"]}",
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_vert, color: Color.fromARGB(255, 2, 164, 159)),
          onPressed: () {
            _showPatientDetails(context, patient);
          },
        ),
      ),
    );
  }

  // نافذة عرض تفاصيل المريض
  void _showPatientDetails(BuildContext context, Map<String, String> patient) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text("تفاصيل المريض"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("الاسم: ${patient["name"]}"),
              Text("العمر: ${patient["age"]}"),
              Text("الجنس: ${patient["gender"]}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("إغلاق"),
            ),
          ],
        );
      },
    );
  }

  // نافذة إضافة مريض جديد
  void _addNewPatient(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        final ageController = TextEditingController();
        final genderController = TextEditingController();

        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text("إضافة مريض جديد"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "اسم المريض"),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: "العمر"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: genderController,
                decoration: InputDecoration(labelText: "الجنس (ذكر/أنثى)"),
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
