// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // height: 100,
        // width: 100,
        // color: Colors.white,
        child: CircularProgressIndicator(
          color: Colors.orange,
        ),
        // TweenAnimationBuilder(
        //     tween: Tween(begin: 0.0, end: 1.0),
        //     duration: Duration(seconds: 4),
        //     builder: (context, value, _) => SizedBox(
        //           width: 50,
        //           height: 50,
        //           child: CircularProgressIndicator(
        //             value: 0.5,
        //             backgroundColor: Colors.blue,
        //             strokeWidth: 3,
        //           ),
        //         ))
      ),
    );
  }
}
