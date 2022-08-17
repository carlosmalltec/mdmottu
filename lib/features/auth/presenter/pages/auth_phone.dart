import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';

class AuthPhone extends StatefulWidget {
  final AuthController controller;

  const AuthPhone({ Key? key, required this.controller }) : super(key: key);

  @override
  State<AuthPhone> createState() => _AuthPhoneState();
}

class _AuthPhoneState extends State<AuthPhone> {
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}