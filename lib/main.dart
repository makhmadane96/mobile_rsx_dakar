import 'package:flutter/material.dart';
import 'package:mobile_rsx/HomePage.dart';
import 'package:mobile_rsx/login.dart';

void main() {

  runApp(
      MaterialApp(
        title: "M1 RX",
        theme: ThemeData(
          primarySwatch: Colors.pink
        ),
        home: LoginPage(),
      )
  );
}
