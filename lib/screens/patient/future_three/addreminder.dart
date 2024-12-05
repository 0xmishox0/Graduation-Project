import 'package:flutter/material.dart';

class MedicationReminderPage extends StatefulWidget {
  @override
  _MedicationReminderPageState createState() => _MedicationReminderPageState();
}

class _MedicationReminderPageState extends State<MedicationReminderPage> {
  final List<Map<String, String>> _medications = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  void _addMedication() {
    final String name = _nameController.text.trim();
    final String dose = _doseController.text.trim();
    final String time = _timeController.text.trim();

    if (name.isEmpty || dose.isEmpty || time.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى ملء جميع الحقول'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _medications.add({
        "name": name,
        "dose": dose,
        "time": time,
      });
    });

    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تمت إضافة $name بنجاح!'),
        backgroundColor: Colors.green,
      ),
    );

    _nameController.clear();
    _doseController.clear();
    _timeController.clear();
  }

  void _showAddMedicationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('إضافة دواء جديد'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'اسم الدواء',
                    border: OutlineInputBorder(),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _doseController,
                  decoration: const InputDecoration(
                    labelText: 'الجرعة',
                    border: OutlineInputBorder(),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _timeController,
                  decoration: const InputDecoration(
                    labelText: 'الوقت',
                    border: OutlineInputBorder(),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: _addMedication,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 164, 159),
              ),
              child: const Text(
                'إضافة',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteMedication(int index) {
    setState(() {
      _medications.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حذف الدواء'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تذكير بمواعيد الدواء',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 164, 159),
      ),
      body: _medications.isEmpty
          ? const Center(
              child: Text(
                'لا توجد أدوية مضافة بعد.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _medications.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                final medication = _medications[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.medication, color: Colors.teal),
                    title: Text(
                      medication["name"]!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      "الجرعة: ${medication["dose"]}\nالوقت: ${medication["time"]}",
                      style: const TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteMedication(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMedicationDialog,
        backgroundColor: const Color.fromARGB(255, 2, 164, 159),
        child: const Icon(Icons.add),
      ),
    );
  }
}
