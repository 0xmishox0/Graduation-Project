import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BloodSugarPage extends StatefulWidget {
  const BloodSugarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BloodSugarPageState createState() => _BloodSugarPageState();
}

class _BloodSugarPageState extends State<BloodSugarPage> {
  // متغير الإدخال
  final TextEditingController _controller = TextEditingController();

  // النتيجة
  String result = "";
  Color resultColor = Colors.black;

  // دالة لتقييم مستوى السكر في الدم
  void evaluateBloodSugar() {
    int value = int.tryParse(_controller.text) ?? 0;

    if (value < 70) {
      result =
          "مستوى السكر منخفض جدًا! يُنصح بتناول شيء يحتوي على السكر فورًا.";
      resultColor = Colors.red;
    } else if (value >= 70 && value <= 99) {
      result = "مستوى السكر طبيعي.";
      resultColor = Colors.green;
    } else if (value >= 100 && value <= 125) {
      result = "مستوى السكر أعلى من الطبيعي بقليل. قد تكون حالة ما قبل السكري.";
      resultColor = Colors.orange;
    } else if (value >= 126) {
      result = "مستوى السكر مرتفع جدًا! يُنصح بزيارة طبيب فورًا.";
      resultColor = Colors.red;
    } else {
      result = "أدخل قيمة صالحة!";
      resultColor = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("مستوى السكر في الدم",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        // إضافة عشان الايؤورSingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/3.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 30),

              // إدخال مستوى السكر
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "أدخل مستوى السكر (mg/dL)",
                  labelStyle: const TextStyle(color: Colors.cyan),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.cyan),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 20),

              // زرار الحساب
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    evaluateBloodSugar();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                child: const Text(
                  "تأكيد",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30), // مسافة بين الزر و النتيجة

              // عرض النتيجة
              Text(
                result,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
