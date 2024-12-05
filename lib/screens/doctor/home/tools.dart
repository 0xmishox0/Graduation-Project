import 'package:flutter/material.dart';

class Tools extends StatelessWidget {
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
                  "الأدوات الطبية",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 164, 159),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // الأدوات
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عدد الأعمدة في العرض
                    crossAxisSpacing: 16, // المسافة بين الأعمدة
                    mainAxisSpacing: 16, // المسافة بين الصفوف
                    childAspectRatio: 1.2, // نسبة العرض للارتفاع لكل عنصر
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _buildToolCard(context, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // تصميم بطاقة الأدوات
  Widget _buildToolCard(BuildContext context, int index) {
    // أسماء الأدوات
    List<String> toolNames = [
      "قياس ضغط الدم",
      "حساب الوزن المثالي",
      "مؤشر كتلة الجسم",
      "قياس درجة الحرارة"
    ];

    // أيقونات الأدوات
    List<IconData> toolIcons = [
      Icons.favorite_border,
      Icons.scale,
      Icons.accessibility_new,
      Icons.thermostat,
    ];

    return GestureDetector(
      onTap: () {
        // عند الضغط على الأداة، يمكن أن تفتح نافذة جديدة أو عرض تفاصيل الأداة
        _openToolDetails(context, toolNames[index]);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              toolIcons[index],
              size: 50,
              color: Color.fromARGB(255, 2, 164, 159),
            ),
            SizedBox(height: 10),
            Text(
              toolNames[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 164, 159),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // فتح تفاصيل الأداة
  void _openToolDetails(BuildContext context, String toolName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text("تفاصيل الأداة"),
          content: Text("تفاصيل الأداة: $toolName"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("إغلاق"),
            ),
          ],
        );
      },
    );
  }
}
