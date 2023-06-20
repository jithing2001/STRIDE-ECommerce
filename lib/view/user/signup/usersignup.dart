import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/user/login/userlogin.dart';
import 'package:ecommerce/view/user/signup/widgets/signupfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSignUp extends StatelessWidget {
  const UserSignUp({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 300,
            ),
          ),
          SignupFields(
            title: 'Name',
            hint: 'Enter your Name',
          ),
          SignupFields(title: 'E-mail', hint: 'Enter Your Email'),
          SignupFields(title: 'Password', hint: 'Enter your Password'),
          SignupFields(title: 'Confirm Password', hint: 'Re-Enter Password'),
          Center(
            child: SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(UserLogin());
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
                    Get.to(const UserLogin());
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
