import 'package:flutter/material.dart';

class SecMaind extends StatelessWidget {
  final List<Map<String, String>> neurologists = [
    {
      'name': 'د. محمود عبد الله',
      'specialty': 'علاج الأمراض العصبية',
      'image': 'assets/neurologist1.jpg',
    },
    {
      'name': 'د. فاطمة يوسف',
      'specialty': 'علاج الصداع النصفي',
      'image': 'assets/neurologist2.jpg',
    },
    {
      'name': 'د. سامي حسين',
      'specialty': 'علاج اضطرابات الحركة',
      'image': 'assets/neurologist3.jpg',
    },
    {
      'name': 'د. مروة جمال',
      'specialty': 'تشخيص الأمراض العصبية',
      'image': 'assets/neurologist4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0E0E6),
      appBar: AppBar(
        title: Text('دكاترة المخ والأعصاب'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: neurologists.length,
          itemBuilder: (context, index) {
            final neurologist = neurologists[index];
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
                      backgroundImage: AssetImage(neurologist['image']!),
                    ),
                    SizedBox(width: 16),
                    // معلومات الطبيب
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            neurologist['name']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            neurologist['specialty']!,
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
                                    'تم إرسال طلب حجز موعد مع ${neurologist['name']}'),
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
