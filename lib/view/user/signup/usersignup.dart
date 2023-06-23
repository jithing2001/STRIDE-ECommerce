import 'package:ecommerce/constants.dart';
import 'package:ecommerce/service/authentication.dart';
import 'package:ecommerce/view/bottomnavigation.dart';
import 'package:ecommerce/view/user/login/userlogin.dart';
import 'package:ecommerce/view/user/signup/widgets/signupfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSignUp extends StatelessWidget {
  const UserSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        title: Text(
          'Create New Account',
          style: TextStyle(color: kblack, fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          const Center(
            child: Image(
              image: AssetImage(
                  'assets/images/istockphoto-1305268276-612x612.jpg'),
              height: 250,
            ),
          ),
          SignupFields(
            controller: nameController,
            title: 'Name',
            hint: 'Enter your Name',
          ),
          SignupFields(
              controller: mailController,
              title: 'E-mail',
              hint: 'Enter Your Email'),
          SignupFields(
              controller: phoneController,
              title: 'Phone Number',
              hint: 'Enter Your Number'),
          SignupFields(
              controller: passwordController,
              title: 'Password',
              hint: 'Enter your Password'),
          SignupFields(
              controller: confirmPasswordController,
              title: 'Confirm Password',
              hint: 'Re-Enter Password'),
          Center(
            child: SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    if (mailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      Authentication()
                          .registerWithEmailAndPassword(mailController.text,
                              passwordController.text, nameController.text,phoneController.text)
                          .then((success) {
                        if (success) {
                          Get.offAll( BottomNavigationClass());
                        } else {
                          Get.snackbar('Error', 'Invalid email or password');
                        }
                      });
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 17),
                ),
                kwidth10,
                InkWell(
                  onTap: () {
                    Get.to(UserLogin());
                  },
                  child: const Text(
                    'Sign in',
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
