import 'package:flutter/material.dart';
import 'package:senethhealingfoods/Pages/pages3.dart';
import 'package:senethhealingfoods/Pages/pages4.dart';
import 'package:senethhealingfoods/Pages/pages5.dart';
import 'package:senethhealingfoods/Pages/product1.dart';
import 'package:senethhealingfoods/Pages/product2.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  Widget? widgets = Product1();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              accountName: Text(
                "Seneth Healing Foods",
                style: TextStyle(fontSize: 24),
              ),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "SF",
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ),
              ),
              accountEmail: null,
            ),
            ListTile(
              leading: const Icon(Icons.food_bank_sharp),
              title: const Text(' Burger King'),
              onTap: () {
                setState(() {
                  widgets = Product1();
                });
                ;
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank_outlined),
              title: const Text(' Fried Rice  '),
              onTap: () {
                setState(() {
                  widgets = Product2();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank_rounded),
              title: const Text(' Juice '),
              onTap: () {
                setState(() {
                  widgets = Product3();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.fort_outlined),
              title: const Text('Vegitable Salad'),
              onTap: () {
                setState(() {
                  widgets = Product4();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank_sharp),
              title: const Text('Pizza'),
              onTap: () {
                setState(() {
                  widgets = Product5();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: widgets,
    );
  }
}
