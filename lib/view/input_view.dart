import 'package:firestore_crud/services/database.dart';
import 'package:firestore_crud/shared/constant.dart';
import 'package:firestore_crud/view/output_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class InputView extends StatelessWidget {

  // int? rollNo;
  // String? name;
  // String? department;
  final rollNoController = TextEditingController();
  final nameController = TextEditingController();
  final departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore crud', style: Theme.of(context).textTheme.bodyText1,),
      ),
      body: Column(
        children: [
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Roll No Form Field
                  TextFormField(
                    decoration: kInputDecoration.copyWith(
                      hintText: 'Enter your Roll No',),
                    controller: rollNoController,
                    // onChanged: (value){
                    //   rollNo = int.parse(value);
                    //
                    // },
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Enter your rollNo';
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: kInputDecoration.copyWith(
                      hintText: 'Enter your Name',),
                    controller: nameController,
                    // onChanged: (value){
                    //   name = value;
                    // },
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Enter your name';
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: kInputDecoration.copyWith(
                      hintText: 'Enter your Department',),
                    controller: departmentController,
                    // onChanged: (value){
                    //   department = value;
                    // },
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Enter your department';
                      }
                    },
                  ),



                ],
              ),

            ),


          ),

          // SizedBox(height: 30,),

          // Button to Add data to FireStore
          ElevatedButton(
            child: const Text('Add Data',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            ),
            onPressed: (){
              if(_formkey.currentState!.validate()){
                DatabaseServices(rollNo: int.parse(rollNoController.text), name: nameController.text, department: departmentController.text).addStudent();
                //Fluttertoast.showToast(msg: 'Added to the Database');
                FocusScope.of(context).unfocus();
              }

            },

          ),
          // Button to Read Data from FireStore
          ElevatedButton(
            child: const Text('Retrieve Data',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: (){
             Navigator.push(context,
             MaterialPageRoute(builder: (context)=> OutPutView()));
            },

          ),
        ],
      ),
    );
  }
}