import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DatabaseServices{
  int? rollNo;
  String? name;
  String? department;
  DatabaseServices({this.rollNo, this.name, this.department});
  CollectionReference student = FirebaseFirestore.instance.collection('student');

 Stream<QuerySnapshot> get studentStream {
   return student.snapshots();
 }
  // Create/Add document to the student collection
 Future<void> addStudent(){
   return student
       .doc(rollNo.toString())
       .set(
     {
       'rollNo' : rollNo,
       'name' : name,
       'department' : department,
     }
   ).then((value) => Fluttertoast.showToast(msg: 'Added to Firestore',)
   ).catchError((error){
     print('Failed to process: $error');
   });
 }
}