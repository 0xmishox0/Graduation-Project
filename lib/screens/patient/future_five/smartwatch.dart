import 'package:flutter/material.dart';

class SmartWatch extends StatelessWidget {
  const SmartWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // خلفية ناعمة

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان الرئيسي
              const Text(
                'الخطوات البسيطة لربط ساعتك الذكية',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),

              // شرح بسيط لما يحدث
              const Text(
                'لتتمكن من ربط ساعتك الذكية مع التطبيق، تأكد من تفعيل البلوتوث وضغط على الزر أدناه للبدء في الاتصال. ستتمكن بعد ذلك من التفاعل مع بيانات ساعتك مباشرة.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // زر الربط بالساعات الذكية
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // هنا يمكن إضافة الكود لعملية الربط بالساعات الذكية (افتراضيًا لا نفذ شيء هنا)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('جارٍ الاتصال بالساعات الذكية...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00796B), // اللون المميز
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    shadowColor: const Color(0xFF00796B).withOpacity(0.5),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text(
                    'ابدأ الاتصال',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ArbFONTS-LamaSans',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // صورة الساعة الذكية
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/smartwatch.png', // تأكد من إضافة صورة الساعة الذكية إلى مجلد الصور
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // نص إضافي يمكن للمستخدم قراءته
              const Text(
                'تأكد من أن ساعتك الذكية في وضع الاتصال وتكون قريبة من الهاتف.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
