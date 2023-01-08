import 'dart:convert';

import 'package:flutter/material.dart';
import 'Sign-Up.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // {User authentication Register}
    //  "email": "eve.holt@reqres.in",
    //  "password": "pistol"
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}