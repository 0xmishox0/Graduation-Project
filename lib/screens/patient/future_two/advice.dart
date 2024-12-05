import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Advice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // عدد الأقسام
      child: Scaffold(
        appBar: AppBar(
          title: const Text('نصائح طبية',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 2, 164, 159),
          bottom: const TabBar(
            unselectedLabelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'ArbFONTS-LamaSans',
              fontWeight: FontWeight.bold,
            ),
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'التغذية'),
              Tab(text: 'اللياقة'),
              Tab(text: 'الصحة النفسية'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TipsList(tips: [
              "تناول وجبات غذائية متوازنة تحتوي على الفيتامينات والمعادن.",
              "اشرب كمية كافية من الماء يومياً للحفاظ على صحة جسمك.",
              "قلل من تناول السكريات والأطعمة المصنعة.",
              "احرص على تناول الخضروات والفواكه يومياً.",
            ]),
            TipsList(tips: [
              "مارس التمارين الرياضية بانتظام لتعزيز اللياقة البدنية.",
              "قم بالمشي لمدة 30 دقيقة يومياً.",
              "حافظ على وضعية جسم صحيحة أثناء الجلوس والوقوف.",
              "احرص على الإحماء قبل التمارين لتجنب الإصابات.",
            ]),
            TipsList(tips: [
              "تجنب الإجهاد المفرط وحافظ على راحتك النفسية.",
              "مارس التأمل أو اليوغا لتحسين صحتك النفسية.",
              "احرص على التواصل مع الأصدقاء والعائلة.",
              "احصل على وقت كافٍ للراحة والنوم.",
            ]),
          ],
        ),
      ),
    );
  }
}

class TipsList extends StatelessWidget {
  final List<String> tips;

  const TipsList({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.lightbulb, color: Colors.teal),
            title: Text(
              tips[index],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textDirection: TextDirection.rtl,
            ),
          ),
        );
      },
    );
  }
}
