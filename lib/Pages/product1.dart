import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:senethhealingfoods/model/productmodel.dart';
import 'package:senethhealingfoods/services/feedservice.dart';

class Product1 extends StatefulWidget {
  const Product1({super.key});

  @override
  State<Product1> createState() => _Product1State();
}

class _Product1State extends State<Product1> {
  List<Product> product = [];
  List<Product> fliterprodct = [];

  Future<void> fetchproduct() async {
    final List<Product> productsindatabase =
        await Feedservice().getproduct1toserch();
    setState(() {
      product = productsindatabase;
      fliterprodct = productsindatabase;
    });
  }

  void searchProducts(String query) {
    setState(() {
      fliterprodct = product
          .where((products) =>
              products.pname.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchproduct();
  }

  @override
  Widget build(BuildContext context) {
    final formdec = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: Divider.createBorderSide(context),
    );

    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Burger",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Search Bar
          Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: formdec,
                enabledBorder: formdec,
                focusedBorder: formdec,
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
              ),
              onChanged: searchProducts,
            ),
          ),
          const SizedBox(height: 15),

          Expanded(
            child: GridView.builder(
              itemCount: fliterprodct.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 20,
                childAspectRatio: 3 / 5,
              ),
              itemBuilder: (context, index) {
                final produc = fliterprodct[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        width: 200,
                        height: 275,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
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
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                produc.pname,
                                style: const TextStyle(color: Colors.amber),
                              ),
                              Text(produc.description),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
