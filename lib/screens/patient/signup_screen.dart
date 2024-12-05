import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 35,
            )),
      ),
      backgroundColor: const Color(0xFFB0E0E6),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: width,
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: width,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.541),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  bottom: 5,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_sharp,
                                      size: 30,
                                    ),
                                    labelText: 'الإسم',
                                    labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    hintText: 'الإسم بالكامل',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  bottom: 5,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: 30,
                                    ),
                                    labelText: 'رقم الهاتف',
                                    labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    hintText: 'رقم الهاتف',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: SizedBox(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  bottom: 5,
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  bottom: 5,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: !showPassword,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.password,
                                      size: 30,
                                    ),
                                    labelText: 'إعادة كتابة كلمة المرور',
                                    labelStyle: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    hintText: 'إعادة كتابة كلمة المرور',
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 325,
                            height: 55,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Color.fromARGB(255, 4, 136, 224),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'إنشاء حساب',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          const Text(
                            'التسجيل من خلال : ',
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUp()));
                                    },
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
                                      FontAwesomeIcons.squareFacebook,
                                      size: 50,
                                      color: Color.fromARGB(255, 8, 114, 201),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
