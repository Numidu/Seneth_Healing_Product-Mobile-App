import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Notifications",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 40, color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('notifications')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No notifications yet"));
            }

            var notifications = snapshot.data!.docs;

            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                var notification = notifications[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.yellowAccent,
                    splashColor: Colors.amber,
                    autofocus: true,
                    title: Text(notification['title']),
                    subtitle: Text(notification['body']),
                    trailing:
                        Text(notification['timestamp'].toDate().toString()),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
