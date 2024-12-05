// import 'package:do_medical/doctor/doctor_register.dart';
// import 'package:do_medical/screens/BotNavBar.dart';
import 'package:do_medical/screens/doctor/doctor_register.dart';
import 'package:do_medical/screens/patient/botnavbar.dart';
import 'package:do_medical/screens/patient/forgetpassword.dart';
// import 'package:do_medical/screens/forgetpassword.dart';
import 'package:do_medical/screens/patient/signup_screen.dart';
import 'package:flutter/material.dart';
// import 'package:do_medical/screens/signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFB0E0E6),
      body: Center(
        child: Column(
          children: [
            // الجزء الاول
            Expanded(
              flex: 1,
              child: SizedBox(
                // width: width,
                child: Center(
                  child: Image.asset(
                    'assets/login.png',
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
            ),
            // الجزء التاني
            Expanded(
              flex: 2,
              child: Container(
                width: width,
                // height: 300,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.541),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontFamily: 'ArbFONTS-LamaSans',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const SizedBox(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 8,
                                right: 8,
                                bottom: 5,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    size: 30,
                                  ),
                                  labelText: 'البريد الإلكتروني',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  hintText: 'البريد الإلكتروني',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 12),
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !showPassword,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.password,
                                    size: 30,
                                  ),
                                  labelText: 'كلمة المرور',
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  hintText: 'كلمة المرور',
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    icon: Icon(
                                      showPassword
                                          ? Icons.visibility
                                          : Icons.remove_red_eye_outlined,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          // فيه مشكلة هنا => وهي اني عايز البوتون دا يكون لازق في البوكس بتاع الباس
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordPage()));
                                  },
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          right: 20, bottom: 25)),
                                  child: const Text(
                                    'هل نسيت كلمة المرور ؟',
                                    style: TextStyle(
                                      color: Color.fromARGB(179, 0, 0, 0),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 325,
                            height: 55,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Color(0xFF007BFF),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BotNavBar()));
                              },
                              child: const Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "ليس لديك حساب ؟",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: const Text(
                                  'إنشاء حساب',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 226, 15, 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Doctor_register()));
                                },
                                child: const Text(
                                  'تسجيل الأطباء',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 226, 15, 0),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'تسجيل الدخول من خلال :',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    // height: 10,
                                    width: width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const FaIcon(
                                            FontAwesomeIcons.squareXTwitter,
                                            size: 50,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignUp()));
                                          },
                                          child: const FaIcon(
                                            FontAwesomeIcons.linkedin,
                                            size: 50,
                                            color: Color(0xFF0A66C2),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignUp()));
                                          },
                                          child: const FaIcon(
                                            FontAwesomeIcons.squareFacebook,
                                            size: 50,
                                            color: Color.fromARGB(
                                                255, 8, 114, 201),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignUp()));
                                          },
                                          child: const FaIcon(
                                            FontAwesomeIcons.squareGithub,
                                            size: 50,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
