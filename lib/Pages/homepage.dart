import 'dart:ui';

import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:senethhealingfoods/model/productmodel.dart';
import 'package:senethhealingfoods/reusable/corosolve.dart';
import 'package:senethhealingfoods/services/feedservice.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  image: DecorationImage(
                    image: const AssetImage("assets/4.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.darken),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 17,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Colombo",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.person, color: Colors.white)
                    ],
                  ),
                )),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green.shade600.withOpacity(0.2)),
                  // Adjust opacity for the shadow effect
                ),
              ),
            ),
            const Positioned(
              bottom: 150,
              left: 50,
              right: 50,
              child: Text(
                "Seneth Healing Foods",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Positioned(
              bottom: 90,
              top: 125,
              left: 50,
              right: 50,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Text(
                    "You can use any kind of product with us",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(height: 200, child: Corosolve()),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Trending",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
        StreamBuilder(
          stream: Feedservice().getproduct1(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Fail");
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text("No Data Availble");
            }
            final List<Product> product = snapshot.data!;
            return SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final produc = product[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          width: 200,
                          height: 275,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              GoRouter.of(context)
                                  .push("/productdescription", extra: produc);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  produc.url,
                                  width: 100,
                                  height: 100,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.error),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  produc.pname,
                                  style: TextStyle(color: Colors.amber),
                                ),
                                Text(produc.description),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    )));
  }
}
