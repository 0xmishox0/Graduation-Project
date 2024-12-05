import 'package:flutter/material.dart';

class DentistsPage extends StatelessWidget {
  final List<Map<String, String>> dentists = [
    {
      'name': 'د. أحمد سليمان',
      'specialty': 'تقويم الأسنان',
      'image': 'assets/dentist1.jpg',
    },
    {
      'name': 'د. مروة عبد الله',
      'specialty': 'علاج جذور الأسنان',
      'image': 'assets/dentist2.jpg',
    },
    {
      'name': 'د. خالد محمود',
      'specialty': 'جراحة الفم والأسنان',
      'image': 'assets/dentist3.jpg',
    },
    {
      'name': 'د. ليلى حسين',
      'specialty': 'تجميل الأسنان',
      'image': 'assets/dentist4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0E0E6),
      appBar: AppBar(
        title: Text('أطباء تخصص الأسنان'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dentists.length,
          itemBuilder: (context, index) {
            final dentist = dentists[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // صورة الطبيب
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(dentist['image']!),
                    ),
                    SizedBox(width: 16),
                    // معلومات الطبيب
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dentist['name']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            dentist['specialty']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // أزرار التفاعل
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('حجز موعد'),
                                content: Text(
                                    'تم إرسال طلب حجز موعد مع ${dentist['name']}'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('إغلاق'),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('حجز موعد'),
                        ),
                        SizedBox(height: 8),
                        OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('تم نسخ رقم الهاتف للتواصل.'),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.blue),
                          ),
                          child: Text('تواصل'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
