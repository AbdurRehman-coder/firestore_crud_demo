import 'package:firestore_crud/shared/constant.dart';
import 'package:flutter/material.dart';
class InputView extends StatelessWidget {

  int? rollNo;
  String? name;
  String? department;

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
                  TextFormField(
                    decoration: kInputDecoration.copyWith(
                      hintText: 'Enter your Roll No',),
                    onChanged: (value){
                      rollNo = value as int;
                    },
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Enter your rollNo';
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: kInputDecoration.copyWith(
                      hintText: 'Enter your Name',),
                    onChanged: (value){
                      name = value;
                    },
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
                    onChanged: (value){
                      department = value;
                    },
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Enter your department';
                      }
                    },
                  ),
                ],
              ),
            ),

          )
        ],
      ),
    );
  }
}