import 'package:flutter/material.dart';
import 'package:senethhealingfoods/Pages/product1.dart';

import 'package:senethhealingfoods/model/productmodel.dart';
import 'package:senethhealingfoods/reusable/dropdown.dart';

class Productdescription extends StatelessWidget {
  final Product products1;
  const Productdescription({super.key, required this.products1});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Product Details",
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(size: 30),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ClipRRect(
                child: Image.network(products1.url),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: RichText(
                      text: WidgetSpan(
                          child: Text(
                        products1.description,
                        style: const TextStyle(fontSize: 19),
                      )),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 22),
                      ),
                      Text(products1.pname),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Category",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 22)),
                      Text(products1.catogory)
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Flavour",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 22)),
                      Text(products1.flavour),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ), //AppBar
    )); //
  }
}
