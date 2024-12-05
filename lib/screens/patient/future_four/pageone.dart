import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BloodPressurePage extends StatefulWidget {
  const BloodPressurePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BloodPressurePageState createState() => _BloodPressurePageState();
}

class _BloodPressurePageState extends State<BloodPressurePage> {
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  String result = "";
  Color resultColor = Colors.black;

  // دالة  ضغط الدم
  void evaluateBloodPressure() {
    int systolic = int.tryParse(_systolicController.text) ?? 0;
    int diastolic = int.tryParse(_diastolicController.text) ?? 0;

    if (systolic < 90 || diastolic < 60) {
      result = "ضغط الدم منخفض جدًا. راجع طبيبك.";
      resultColor = Colors.red;
    } else if (systolic >= 90 &&
        systolic <= 120 &&
        diastolic >= 60 &&
        diastolic <= 80) {
      result = "ضغط الدم طبيعي.";
      resultColor = Colors.green;
    } else if (systolic > 120 && systolic <= 140 ||
        diastolic > 80 && diastolic <= 90) {
      result = "ضغط الدم مرتفع قليلاً. راقب حالتك.";
      resultColor = Colors.orange;
    } else if (systolic > 140 || diastolic > 90) {
      result = "ضغط الدم مرتفع جدًا! راجع طبيبك فورًا.";
      resultColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ضغط الدم",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        // واسكرول والايؤور SingleChildScrollView هنا عشان مقاس الشاشه
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/s.gif.gif',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),

              //  الضغط الانقباضي
              TextField(
                controller: _systolicController,
                decoration: InputDecoration(
                  labelText: "الضغط الانقباضي (mmHg)",
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

              // إدخال الضغط الانبساطي
              TextField(
                controller: _diastolicController,
                decoration: InputDecoration(
                  labelText: "الضغط الانبساطي (mmHg)",
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
              const SizedBox(height: 30),

              // زر ار
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    evaluateBloodPressure();
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
              const SizedBox(height: 30),

              // عرض النتيجة
              Text(
                result,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
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
