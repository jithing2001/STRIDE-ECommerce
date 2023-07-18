import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/service/profile_service.dart';
import 'package:ecommerce/view/profile/widgets/profile_edit_fields.dart';
import 'package:ecommerce/view/profile/widgets/profilefields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final user = FirebaseAuth.instance.currentUser;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('user_details')
              .doc(user!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const CircularProgressIndicator();
            }
            nameEditingController.text = snapshot.data!['name'];
            phoneEditingController.text = snapshot.data!['phone Number'];

            return SingleChildScrollView(
              child: Column(
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
                  ProfileFields(title: 'Name', input: snapshot.data!['name']),
                  ProfileFields(
                    title: 'E-mail',
                    input: snapshot.data!['email'],
                  ),
                  ProfileFields(
                    title: 'Phone Number',
                    input: snapshot.data!['phone Number'],
                  ),
                  kheight20,
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            backgroundColor: kwhite,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            content: SizedBox(
                              height: 220,
                              child: Column(
                                children: [
                                  const Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  kheight10,
                                  ProfieEditFields(
                                    inputController: nameEditingController,
                                    hint: 'Enter a new name',
                                  ),
                                  kheight10,
                                  ProfieEditFields(
                                      inputController: phoneEditingController,
                                      hint: 'Enter a new number'),
                                  kheight10,
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: IconButton(
                                          onPressed: () async {
                                            await ProfileService().editProfile(
                                                name:
                                                    nameEditingController.text,
                                                number: phoneEditingController
                                                    .text);
                                            Get.back();
                                          },
                                          icon: const Icon(Icons.edit)))
                                ],
                              ),
                            ),
                          ));
                        },
                        child: const Text('Edit')),
                  )
                ],
              ),
            );
          }),
    );
  }
}
