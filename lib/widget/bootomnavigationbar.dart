import 'package:flutter/material.dart';
import 'package:senethhealingfoods/Pages/dataopener.dart';
import 'package:senethhealingfoods/Pages/foodRequiredpage.dart';
import 'package:senethhealingfoods/Pages/homepage.dart';
import 'package:senethhealingfoods/Pages/product1.dart';
import 'package:senethhealingfoods/widget/drawer.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  final List<Widget> screens = [
    const Homepage(),
    const Drawers(),
    Foodrequiredpage(),
    NotificationsScreen(),
  ];

  void onItemTapped(int indexs) {
    setState(() {
      index = indexs;
      // print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black, // Set background color to black
            borderRadius:
                BorderRadius.circular(40), // Optional: Keep rounded edges
          ),
          child: BottomNavigationBar(
            backgroundColor:
                Colors.transparent, // Set transparent to avoid overlap
            selectedItemColor: Colors.lightGreen,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType
                .fixed, // Ensures the color applies correctly
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_home), label: "Add Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.network_cell), label: "About Us"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notification_add_outlined),
                  label: "Notification"),
            ],
            currentIndex: index,
            onTap: onItemTapped,
          ),
        ),
      ),
      body: screens[index],
    );
  }
}
