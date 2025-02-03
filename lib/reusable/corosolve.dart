import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Corosolve extends StatelessWidget {
  Corosolve({super.key});

  final List<Widget> items = [
    ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        "assets/1.png",
        fit: BoxFit.cover,
        height: 200,
        width: 400,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        "assets/2.png",
        fit: BoxFit.cover,
        height: 200,
        width: 400,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        "assets/3.jpg",
        fit: BoxFit.cover,
        height: 200,
        width: 200,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        "assets/4.png",
        fit: BoxFit.cover,
        height: 200,
        width: 200,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        "assets/5.jpg",
        fit: BoxFit.cover,
        height: 200,
        width: 200,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableCarousel(
        options: ExpandableCarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
        ),
        items: items.map((widget) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.1,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
            ),
            child: widget,
          );
        }).toList(),
      ),
    );
  }
}
