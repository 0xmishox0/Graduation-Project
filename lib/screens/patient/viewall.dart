import 'package:flutter/material.dart';

class Viewall extends StatelessWidget {
  final List specialties = [
    {'name': 'تخصص أسنان', 'image': 'assets/clean.png'},
    {'name': 'تخصص عيون', 'image': 'assets/eye-care.png'},
    {'name': 'تخصص مخ وأعصاب', 'image': 'assets/brain.png'},
    {'name': 'تخصص قلب', 'image': 'assets/heart-rate.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'كل التخصصات',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: specialties.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Image.asset(
                specialties[index]['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                specialties[index]['name']!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
