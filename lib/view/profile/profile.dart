import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/profile/widgets/profile_edit_fields.dart';
import 'package:ecommerce/view/profile/widgets/profilefields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.dialog(AlertDialog(
                  backgroundColor: kwhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  content: SizedBox(
                    height: 210,
                    child: Column(
                      children: [
                        const Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        kheight10,
                        ProfieEditFields(
                          hint: 'Enter a new name',
                        ),
                        kheight10,
                        ProfieEditFields(hint: 'Enter a new number'),
                        ElevatedButton(onPressed: () {}, child: const Text('Edit'))
                      ],
                    ),
                  ),
                ));
              },
              icon: Icon(
                Icons.edit,
                color: kblack,
                size: 27,
              ))
        ],
        elevation: 0,
        backgroundColor: kwhite,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight80,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: kblack,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: const Image(
                    image: AssetImage(
                        'assets/images/—Pngtree—fashion boy avatar_8855187.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          kheight80,
          ProfileFormFields(title: 'Name', input: 'Jithin'),
          ProfileFormFields(
              title: 'Email Address', input: 'jithinkyd70@gmail.com'),
          ProfileFormFields(
            title: 'Phone Number',
            input: '7025778330',
          )
        ],
      ),
    );
  }
}
