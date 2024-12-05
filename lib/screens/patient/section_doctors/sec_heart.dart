import 'package:flutter/material.dart';

class SecHeart extends StatelessWidget {
  final List<Map<String, String>> cardiologists = [
    {
      'name': 'د. أحمد سالم',
      'specialty': 'أمراض القلب والشرايين',
      'image': 'assets/cardiologist1.jpg',
    },
    {
      'name': 'د. فاطمة علي',
      'specialty': 'علاج ضيق الشرايين وارتفاع ضغط الدم',
      'image': 'assets/cardiologist2.jpg',
    },
    {
      'name': 'د. مصطفى حسن',
      'specialty': 'جراحة القلب المفتوح',
      'image': 'assets/cardiologist3.jpg',
    },
    {
      'name': 'د. نجلاء سامي',
      'specialty': 'علاج قصور القلب والأوعية الدموية',
      'image': 'assets/cardiologist4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0E0E6),
      appBar: AppBar(
        title: Text('دكاترة تخصص القلب'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cardiologists.length,
          itemBuilder: (context, index) {
            final cardiologist = cardiologists[index];
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
                      backgroundImage: AssetImage(cardiologist['image']!),
                    ),
                    SizedBox(width: 16),
                    // معلومات الطبيب
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cardiologist['name']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            cardiologist['specialty']!,
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
                                    'تم إرسال طلب حجز موعد مع ${cardiologist['name']}'),
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
                            backgroundColor: Colors.red,
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
                            side: BorderSide(color: Colors.red),
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
