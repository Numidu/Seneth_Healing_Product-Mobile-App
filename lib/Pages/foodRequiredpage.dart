import 'package:flutter/material.dart';

import 'package:senethhealingfoods/reusable/custominput.dart';
import 'package:senethhealingfoods/services/feedservice.dart';

class Foodrequiredpage extends StatelessWidget {
  Foodrequiredpage({super.key});
  final TextEditingController fnamectrleer = TextEditingController();
  final TextEditingController snamectrlea = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController adress = TextEditingController();
  final TextEditingController enquiry = TextEditingController();
  final GlobalKey<FormState> keys = GlobalKey<FormState>();

  void getdata(BuildContext context) async {
    final getdata = {
      "firstName": fnamectrleer.text,
      "lastname": snamectrlea.text,
      "phoneNumber": phonenumber.text,
      "email": email.text,
      "adress": adress.text,
      "enquiry": enquiry.text,
    };
    await Feedservice().inputdata(getdata);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Successfully"),
      backgroundColor: Colors.greenAccent,
    ));
    print("Came to method");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(120))),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Seneth Healing Foods",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Align(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            foregroundImage: AssetImage("assets/logo.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: Text(
                      "Choose Your favourite foods",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
              key: keys,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Custominput(
                      name: "Enter First name",
                      icons: Icons.person,
                      contrll: fnamectrleer,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Custominput(
                      contrll: snamectrlea,
                      name: "Enter Last name",
                      icons: Icons.person_2,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Custominput(
                      contrll: phonenumber,
                      name: "Enter phonenumber",
                      icons: Icons.phone,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Custominput(
                      contrll: email,
                      name: "Enter Email",
                      icons: Icons.email,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Custominput(
                      contrll: adress,
                      name: "Enter adress",
                      icons: Icons.location_city,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Custominput(
                      contrll: enquiry,
                      name: "Enter Enquiry",
                      icons: Icons.equalizer_rounded,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (keys.currentState!.validate()) {
                        getdata(context);
                        fnamectrleer.clear();
                        snamectrlea.clear();
                        phonenumber.clear();
                        email.clear();
                        adress.clear();
                        enquiry.clear();
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
