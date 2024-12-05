import 'package:flutter/material.dart';

class Donation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 100, 100),
      appBar: AppBar(
        title: Text('صفحة التبرع'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // قسم التبرع لأطفال مرضى السرطان
              DonationSection(
                title: 'التبرع لأطفال مرضى السرطان',
                description:
                    'ساهم في توفير العلاج ورسم الابتسامة على وجوه الأطفال الذين يعانون من السرطان. كل تبرع يحدث فرقًا كبيرًا.',
                imagePath: 'assets/cancer_child.jpg',
                onDonate: () {
                  showThankYouDialog(context, 'أطفال مرضى السرطان');
                },
              ),
              SizedBox(height: 20),
              // قسم التبرع لأطفال غزة
              DonationSection(
                title: 'التبرع لأطفال غزة',
                description:
                    'ساعد في تقديم الدعم لأطفال غزة الذين يحتاجون إلى الغذاء والدواء والتعليم. تبرعك يساهم في تغيير حياتهم.',
                imagePath: 'assets/gaza_child.jpg',
                onDonate: () {
                  showThankYouDialog(context, 'أطفال غزة');
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void showThankYouDialog(BuildContext context, String cause) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('شكراً لتبرعك!'),
        content: Text('لقد ساهمت في دعم $cause. شكراً لجودك وكرمك.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('إغلاق'),
          ),
        ],
      ),
    );
  }
}

class DonationSection extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onDonate;

  const DonationSection({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onDonate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: onDonate,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                    child: Text(
                      'تبرع الآن',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
