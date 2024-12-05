import 'package:flutter/material.dart';

class Roshita extends StatefulWidget {
  @override
  _RoshitaState createState() => _RoshitaState();
}

class _RoshitaState extends State<Roshita> {
  // بيانات الطبيب
  final TextEditingController doctorNameController =
      TextEditingController(text: "د. أحمد خالد");
  final TextEditingController specialtyController =
      TextEditingController(text: "استشاري الأمراض الباطنية");
  final TextEditingController clinicAddressController =
      TextEditingController(text: "القاهرة، مصر");
  final TextEditingController phoneNumberController =
      TextEditingController(text: "0123456789");

  // بيانات المريض
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController patientAgeController = TextEditingController();

  // تفاصيل الوصفة
  final TextEditingController prescriptionDetailsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // عنوان الصفحة
                _buildHeader(),

                SizedBox(height: 20),

                // بيانات الطبيب
                _buildSectionTitle("بيانات الطبيب"),
                _buildDoctorInfo(),

                SizedBox(height: 20),

                // بيانات المريض
                _buildSectionTitle("بيانات المريض"),
                _buildPatientInfo(),

                SizedBox(height: 20),

                // تفاصيل الوصفة
                _buildSectionTitle("تفاصيل الوصفة"),
                _buildPrescriptionDetails(),

                SizedBox(height: 20),

                // أزرار التحكم
                _buildFooterButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // رأس الصفحة
  Widget _buildHeader() {
    return Center(
      child: Text(
        "روشتة طبية",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 2, 164, 159),
        ),
      ),
    );
  }

  // عنوان القسم
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 2, 164, 159),
      ),
    );
  }

  // بيانات الطبيب
  Widget _buildDoctorInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildInfoRow(Icons.person, "اسم الطبيب", doctorNameController),
            _buildInfoRow(
                Icons.medical_services, "التخصص", specialtyController),
            _buildInfoRow(
                Icons.location_on, "عنوان العيادة", clinicAddressController),
            _buildInfoRow(Icons.phone, "رقم الهاتف", phoneNumberController),
          ],
        ),
      ),
    );
  }

  // بيانات المريض
  Widget _buildPatientInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildInfoRow(Icons.person, "اسم المريض", patientNameController),
            _buildInfoRow(Icons.calendar_today, "العمر", patientAgeController),
          ],
        ),
      ),
    );
  }

  // تفاصيل الوصفة
  Widget _buildPrescriptionDetails() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: prescriptionDetailsController,
          maxLines: null,
          decoration: InputDecoration(
            hintText: "اكتب تفاصيل الوصفة هنا...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  // أزرار التحكم
  Widget _buildFooterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: Colors.green,
          ),
          onPressed: _savePrescription,
          icon: Icon(Icons.save),
          label: Text("حفظ الروشتة"),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: Colors.red,
          ),
          onPressed: _clearFields,
          icon: Icon(Icons.delete),
          label: Text("مسح البيانات"),
        ),
      ],
    );
  }

  // صف بيانات مع أيقونة
  Widget _buildInfoRow(
      IconData icon, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Color.fromARGB(255, 2, 164, 159)),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // حفظ الروشتة
  void _savePrescription() {
    print("تم حفظ الروشتة:");
    print("اسم الطبيب: ${doctorNameController.text}");
    print("اسم المريض: ${patientNameController.text}");
    print("العمر: ${patientAgeController.text}");
    print("الوصفة: ${prescriptionDetailsController.text}");
  }

  // مسح الحقول
  void _clearFields() {
    setState(() {
      patientNameController.clear();
      patientAgeController.clear();
      prescriptionDetailsController.clear();
    });
  }
}
