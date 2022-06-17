import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kanban/pages/home_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: HomePage(),
        backgroundColor: Colors.black,
      ),
    ),
  );
}
