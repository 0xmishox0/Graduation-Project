import 'package:flutter/material.dart';

class WeightHeightPage extends StatefulWidget {
  const WeightHeightPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeightHeightPageState createState() => _WeightHeightPageState();
}

class _WeightHeightPageState extends State<WeightHeightPage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String result = "";

  // دالة عشان احسب كتله الجسم
  void evaluateBMI() {
    double weight = double.tryParse(_weightController.text) ?? 0;
    double height = double.tryParse(_heightController.text) ?? 0;

    if (weight == 0 || height == 0) {
      return;
    }

    double bmi = weight / (height * height);
    if (bmi < 18.5) {
      result = "أنت تحت الوزن الطبيعي. حاول زيادة الوزن.";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      result = "وزنك مثالي.";
    } else {
      result = "أنت فوق الوزن المثالي. حاول تقليل الوزن.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("حساب الوزن والطول",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        // ده البيحل ايرور المسافه SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/5.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20), // مسافة بسايز بوكس ى

              //  إدخال الوزن
              TextField(
                controller: _weightController,
                decoration: InputDecoration(
                  labelText: "أدخل وزنك (كجم)",
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
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 15), // // مسافة بسايز بوكس
              //  إدخال الطول
              TextField(
                controller: _heightController,
                decoration: InputDecoration(
                  labelText: "أدخل طولك (متر)",
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
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(
                  height: 20), // مسافة بين مكان ادخال البيانات والزرار

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    evaluateBMI();
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
                  "حساب",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 20), // مسافة بين الزرار و النتيجة

              // عرض النتيجة
              Text(
                result,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
