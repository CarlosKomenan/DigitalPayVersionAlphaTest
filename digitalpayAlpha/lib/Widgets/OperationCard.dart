// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_const_constructors_in_immutables, dead_code, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';

class OperationCard extends StatelessWidget {
  OperationCard({
    Key? key,
    required this.name,
    required this.img,
    required this.decor,
  }) : super(key: key);
  final String name;
  final Image img;
  final Decoration decor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 170,
        width: 150,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            img,
            SizedBox(
              height: 15,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        decoration: decor,
      ),
    );
  }
}
