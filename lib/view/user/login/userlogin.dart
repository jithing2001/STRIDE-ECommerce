import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/user/login/widgets/loginbuttonwidget.dart';
import 'package:ecommerce/view/user/login/widgets/loginfields.dart';
import 'package:ecommerce/view/user/signup/usersignup.dart';
import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Center(
              child: Image(
            image: AssetImage('assets/images/Blogpost-image.png'),
            height: 200,
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
            title: 'E-mail',
            hint: 'Enter your Email',
          ),
          LoginFields(title: 'Password', hint: 'Enter your Password'),
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
          ),
          const Center(
            child: Text(
              'or',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: loginbottonwidget(title: 'Continue with Google'),
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserSignUp(),
                  )),
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
