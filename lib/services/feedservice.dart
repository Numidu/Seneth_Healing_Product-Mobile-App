import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:senethhealingfoods/model/inquery.dart';

import 'package:senethhealingfoods/model/productmodel.dart';

class Feedservice {
  final CollectionReference productcollection =
      FirebaseFirestore.instance.collection("product1");

  final CollectionReference productenquiry =
      FirebaseFirestore.instance.collection("enquiry");

  final CollectionReference product2collection =
      FirebaseFirestore.instance.collection("product2");

  final CollectionReference product3collection =
      FirebaseFirestore.instance.collection("product3");

  final CollectionReference product4collection =
      FirebaseFirestore.instance.collection("product4");

  final CollectionReference product5collection =
      FirebaseFirestore.instance.collection("product5");

  Stream<List<Product>> getproduct1() {
    return productcollection.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return Product.fromJson(doc.data() as Map<String, dynamic>);
          },
        ).toList();
      },
    );
  }

  Stream<List<Product>> getproduct2() {
    return product2collection.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return Product.fromJson(doc.data() as Map<String, dynamic>);
          },
        ).toList();
      },
    );
  }

  Stream<List<Product>> getproduct3() {
    return product2collection.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return Product.fromJson(doc.data() as Map<String, dynamic>);
          },
        ).toList();
      },
    );
  }

  Stream<List<Product>> getproduct4() {
    return product2collection.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return Product.fromJson(doc.data() as Map<String, dynamic>);
          },
        ).toList();
      },
    );
  }

  Stream<List<Product>> getproduct5() {
    return product2collection.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return Product.fromJson(doc.data() as Map<String, dynamic>);
          },
        ).toList();
      },
    );
  }

  Future<void> inputdata(Map details) async {
    try {
      print("came to try");
      final Inquery newenquiry = Inquery(
          firstname: details["firstName"] as String? ?? "",
          lastname: details["lastname"] as String? ?? "",
          phonenumber: details["phoneNumber"] as String? ?? "",
          email: details["email"] as String? ?? "",
          adress: details["adress"] as String? ?? "",
          enquiry: details["enquiry"] as String? ?? "");
      final DocumentReference docref =
          await productenquiry.add(newenquiry.toJson());

      print("Added succesfully");
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>> getproduct1toserch() async {
    try {
      final snap = await productcollection.get();
      return snap.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Product>> getproduct2toserch() async {
    try {
      final snap = await product2collection.get();
      return snap.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Product>> getproduct3toserch() async {
    try {
      final snap = await product3collection.get();
      return snap.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Product>> getproduct4toserch() async {
    try {
      final snap = await product4collection.get();
      return snap.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Product>> getproduct5toserch() async {
    try {
      final snap = await product5collection.get();
      return snap.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
