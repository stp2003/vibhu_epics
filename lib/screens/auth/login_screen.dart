import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/top_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;

  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  bool checkTheBox = false;

  check() {
    setState(() {
      checkTheBox = !checkTheBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    //??
    //final controller = Get.put(LoginController());
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TopLogo(width: 320),
                const SizedBox(height: 60),
                CustomTextField(
                  // controller: controller.email,
                  controller: controller,
                  hintText: 'Email or Username',
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  //controller: controller.password,
                  controller: controller,
                  hintText: 'Password',
                  onPressed: showPassword,
                  obscureText: showPass ? false : true,
                  icon: showPass ? Icons.visibility_off : Icons.visibility,
                ),
                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.grey[500],
                            ),
                            child: Checkbox(
                              checkColor: Colors.white,
                              value: checkTheBox ? true : false,
                              onChanged: (value) {
                                check();
                              },
                            ),
                          ),
                          const Text(
                            'Remember Me',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 185, 121),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  customColor: const Color.fromARGB(255, 10, 185, 121),
                  text: 'Sign In',
                  onTap: () {
                    //   if (formKey.currentState!.validate()) {
                    //     LoginController.instance.loginUser(
                    //       controller.email.text.trim(),
                    //       controller.password.text.trim(),
                    //     );
                    //   }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'or Sign In With',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  //onTap: () => controller.googleSignIn(),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Image.asset(
                      'assets/images/google.png',
                      width: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 0.6,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SignUpScreen(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 185, 121),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
