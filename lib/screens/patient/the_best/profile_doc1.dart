import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0E0E6),
      appBar: AppBar(
        title: Text('د. محمد ممدوح'),
        backgroundColor: const Color(0xFFB0E0E6),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الطبيب
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/mo.jpeg'), // أضف الصورة هنا
              ),
            ),
            SizedBox(height: 16),

            // اسم الطبيب
            Center(
              child: Text(
                'د. محمد ممدوح',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: 8),

            // تخصص الطبيب
            Center(
              child: Text(
                'أخصائي تقويم الأسنان',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 16),

            // السيرة الذاتية للطبيب
            Text(
              'السيرة الذاتية:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'د. أحمد سليمان هو أخصائي تقويم الأسنان، حاصل على درجة الماجستير في تقويم الأسنان من جامعة القاهرة. لديه خبرة تفوق 10 سنوات في معالجة الحالات المعقدة باستخدام تقنيات حديثة مثل تقويم الأسنان الثابت والمتحرك. يعمل على تقديم علاج مخصص لكل مريض لتحسين ابتسامته وصحة فمه.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),

            // التعليم والمؤهلات
            Text(
              'التعليم والمؤهلات:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• بكالوريوس طب الأسنان - جامعة القاهرة\n'
              '• ماجستير في تقويم الأسنان - جامعة القاهرة\n'
              '• دورات متخصصة في تقنيات تقويم الأسنان المتقدمة',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),

            // الخبرات العملية
            Text(
              'الخبرات العملية:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• أخصائي تقويم الأسنان في عيادة ABC للأسنان (2013 - 2023)\n'
              '• عضو في الجمعية الأمريكية لتقويم الأسنان\n'
              '• عمل في عيادات طبية دولية في عدة دول.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),

            // أزرار التفاعل
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('حجز موعد'),
                          content:
                              Text('تم إرسال طلب حجز موعد مع د. أحمد سليمان'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text('تواصل'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
