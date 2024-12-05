import 'package:flutter/material.dart';

class SecEyes extends StatelessWidget {
  final List<Map<String, String>> ophthalmologists = [
    {
      'name': 'د. علي حسين',
      'specialty': 'جراحة العيون وتصحيح النظر',
      'image': 'assets/doctor1.jpg',
    },
    {
      'name': 'د. سارة محمود',
      'specialty': 'فحص العيون والعلاج',
      'image': 'assets/doctor2.jpg',
    },
    {
      'name': 'د. أحمد عبد الله',
      'specialty': 'أمراض العيون والتشخيص',
      'image': 'assets/doctor3.jpg',
    },
    {
      'name': 'د. هالة محمد',
      'specialty': 'زراعة العدسات وتجميل العيون',
      'image': 'assets/doctor4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0E0E6),
      appBar: AppBar(
        title: Text('دكاترة تخصص العيون'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ophthalmologists.length,
          itemBuilder: (context, index) {
            final ophthalmologist = ophthalmologists[index];
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
                      backgroundImage: AssetImage(ophthalmologist['image']!),
                    ),
                    SizedBox(width: 16),
                    // معلومات الطبيب
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ophthalmologist['name']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            ophthalmologist['specialty']!,
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
                                    'تم إرسال طلب حجز موعد مع ${ophthalmologist['name']}'),
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
                            backgroundColor: Colors.green,
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
                            side: BorderSide(color: Colors.green),
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
