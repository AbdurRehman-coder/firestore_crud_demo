import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/services/database.dart';
import 'package:flutter/material.dart';
class OutPutView extends StatelessWidget {
 // Stream<QuerySnapshot> student = FirebaseFirestore.instance.
 //  collection('student').snapshots();
  CollectionReference student = FirebaseFirestore.instance.collection('user');
 Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection('student').snapshots();


 List<String> name = [];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStore Data'),
      ),
      body: StreamBuilder<QuerySnapshot>(
            stream: stream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<
                      String,
                      dynamic>;
                  return ListTile(
                    title: Text(data['name'].toString()),
                    subtitle: Text(data['department'].toString()),
                  );
                }).toList(),
              );
            }
            )
    );
    }

}