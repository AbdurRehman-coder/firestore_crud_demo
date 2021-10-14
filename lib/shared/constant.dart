import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final kInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.white70,
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.lightBlueAccent,
        )
    ),
  // fillColor: Colors.grey,
  // filled: true,

);