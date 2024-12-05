import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeartRatePage extends StatefulWidget {
  const HeartRatePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeartRatePageState createState() => _HeartRatePageState();
}

class _HeartRatePageState extends State<HeartRatePage> {
  // متغير الإدخال
  final TextEditingController _controller = TextEditingController();

  // النتيجة
  String result = "";
  Color resultColor = Colors.black;

  // دالة   ضربات القلب
  void evaluateHeartRate() {
    int value = int.tryParse(_controller.text) ?? 0;

    if (value >= 60 && value <= 100) {
      result = "معدل ضربات القلب طبيعي.";
      resultColor = Colors.green;
    } else if (value > 100) {
      result = "معدل ضربات القلب مرتفع.";
      resultColor = Colors.orange;
    } else if (value < 60 && value > 0) {
      result = "معدل ضربات القلب منخفض.";
      resultColor = Colors.red;
    } else {
      result = "أدخل قيمة صالحة!";
      resultColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("معدل ضربات القلب",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.cyan,
        elevation: 0, // إزالة الظل   تحت الشريط الفوق
      ),
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //
              Image.asset(
                'assets/4.gif',
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 20), //

              // دخال معدل ضربات القلب
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: "أدخل معدل ضربات القلب (bpm)",
                    labelStyle: TextStyle(color: Colors.cyan),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(height: 20),

              //     الزرار
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    evaluateHeartRate();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text("تأكيد",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const SizedBox(height: 20),

              Text(
                result,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
