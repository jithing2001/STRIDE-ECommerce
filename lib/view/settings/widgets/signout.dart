import 'package:ecommerce/constants.dart';
import 'package:ecommerce/service/authentication.dart';
import 'package:ecommerce/view/user/login/userlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signout extends StatelessWidget {
  const Signout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [
          const Text('Are you sure?'),
          kheight30,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () async {
                    await Authentication().signOut();
                    Get.offAll(UserLogin());
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontSize: 22, color: Colors.green),
                  )),
              kwidth30,
              InkWell(
                  onTap: () => Get.back(),
                  child: const Text(
                    'No',
                    style: TextStyle(fontSize: 22, color: Colors.red),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
