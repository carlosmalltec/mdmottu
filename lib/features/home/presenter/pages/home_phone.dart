import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomePhone extends StatefulWidget {
  final HomeController controller;

  const HomePhone({ Key? key, required this.controller }) : super(key: key);

  @override
  State<HomePhone> createState() => _HomePhoneState();
}

class _HomePhoneState extends State<HomePhone> {
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('home'),),
           body: Container(),
       );
  }
}