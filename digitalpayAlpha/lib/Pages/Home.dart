// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:digitalpay/Pages/Bilan.dart';
import 'package:flutter/material.dart';

import '../Widgets/ClientCard.dart';
import 'Operation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool masquer = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.blueGrey[50],
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 280,
                  height: 260,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(_borderRaduis),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.orange, Colors.amber],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),

                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: Image.asset(
                                "assets/logoDF.png",
                              ),
                            ),
                            Icon(
                              Icons.settings,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          "DIGITAL PAY",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      color: Colors.white,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
                                height: 80,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Operation()));
                                  },
                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.wifi_protected_setup,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Operation()));
                                        },
                                      ),
                                      Text(
                                        "OPERATION",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            child: Container(
                              color: Colors.black,
                              width: 2,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
                                height: 80,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.assignment_outlined,
                                        size: 40,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Bilan()));
                                      },
                                    ),
                                    Text(
                                      "BILAN",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Container(
            color: Colors.blueGrey[50],
            height: MediaQuery.of(context).size.height - 300,
            child: ListView(
              shrinkWrap: true,
              children: [
                ClientCard(),
                ClientCard(),
                ClientCard(),
                ClientCard(),
                ClientCard(),
                ClientCard(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
