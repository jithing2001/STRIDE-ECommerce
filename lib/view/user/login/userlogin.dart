import 'package:ecommerce/constants.dart';
import 'package:ecommerce/service/authentication.dart';
import 'package:ecommerce/view/bottomnavigation.dart';
import 'package:ecommerce/view/user/login/widgets/loginbuttonwidget.dart';
import 'package:ecommerce/view/user/login/widgets/loginfields.dart';
import 'package:ecommerce/view/user/signup/usersignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserLogin extends StatelessWidget {
  UserLogin({super.key});

  TextEditingController mailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Center(
              child: Image(
            image: AssetImage('assets/images/Blogpost-image.png'),
            height: 300,
            width: 250,
          )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          LoginFields(
            controller: mailController,
            title: 'E-mail',
            hint: 'Enter your Email',
          ),
          LoginFields(
              controller: passwordController,
              title: 'Password',
              hint: 'Enter your Password'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'forgot password',
                style: TextStyle(fontSize: 17, color: Colors.blue),
              ),
              kwidth20
            ],
          ),
          kheight10,
          loginbottonwidget(
            title: 'Sign In',
            onPressed: () {
              if (mailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                Authentication()
                    .signInWithEmailAndPassword(
                        mailController.text, passwordController.text)
                    .then((success) {
                  if (success) {
                    Get.offAll(BottomNavigationClass());
                  } else {
                    // Show an error message indicating incorrect credentials
                    Get.snackbar('Error', 'Invalid email or password');
                  }
                });
              }
            },
          ),
          const Center(
            child: Text(
              'or',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: loginbottonwidget(
              title: 'Continue with Google',
              onPressed: () async {
                UserCredential _cred =
                    await Authentication().signInWithGoogle();

                if (_cred != null) {
                  Get.to(BottomNavigationClass());
                } else {
                  Get.snackbar('error', 'User null');
                }
              },
            ),
          ),
          kheight10,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Dont have an account',
                  style: TextStyle(fontSize: 17),
                ),
                kwidth20,
                InkWell(
                  onTap: () => Get.off(const UserSignUp()),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
