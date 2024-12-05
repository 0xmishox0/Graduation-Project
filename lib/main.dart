import 'package:flutter/material.dart';
import 'package:do_medical/screens/patient/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Do Medical',
      theme: ThemeData(
        fontFamily: 'ArbFONTS-LamaSans',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(158, 108, 77, 161)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      builder: (context, widget) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: widget!,
        );
      },
    );
  }
}
