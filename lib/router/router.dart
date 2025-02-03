import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:senethhealingfoods/Pages/dataopener.dart';

import 'package:senethhealingfoods/Pages/productdescription.dart';
import 'package:senethhealingfoods/model/productmodel.dart';
import 'package:senethhealingfoods/widget/bootomnavigationbar.dart';

class RouterClass {
  final router = GoRouter(
      initialLocation: "/",
      errorPageBuilder: (context, state) {
        return const MaterialPage(
          child: Scaffold(
            body: Center(
              child: Text("This page is not found"),
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: "/",
          name: "Bootomanavigation",
          builder: (context, state) {
            return const BottomNav();
          },
        ),
        GoRoute(
          path: "/productdescription",
          name: "productdescription",
          builder: (context, state) {
            Product product1 = state.extra as Product;
            return Productdescription(
              products1: product1,
            );
          },
        ),
      ]);
}
