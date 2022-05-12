// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, deprecated_member_use, sized_box_for_whitespace

import 'package:digitalpay/Widgets/ClientCard.dart';
import 'package:flutter/material.dart';

class BilanSemaine extends StatelessWidget {
  const BilanSemaine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Bilan Semaine"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Card(
              margin: EdgeInsets.only(
                left: 35,
                right: 35,
                bottom: 10,
              ),
              color: Colors.grey[100],
              shadowColor: Colors.blueGrey,
              elevation: 5,
              shape: const RoundedRectangleBorder(
                  // side: BorderSide(color: Colors.green, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                height: 150,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Période",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "11 Déc 2022",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("-"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "17 Déc 2022",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlineButton(
                          color: Colors.amber,
                          textColor: Colors.amber,
                          child: Text(
                            "Journalier",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          highlightedBorderColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {},
                        ),
                        OutlineButton(
                          color: Colors.amber,
                          textColor: Colors.amber,
                          child: Text(
                            "Mensuel",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          highlightedBorderColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {},
                        ),
                        OutlineButton(
                          color: Colors.amber,
                          textColor: Colors.amber,
                          child: Text(
                            "Autre",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          highlightedBorderColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ClientCard(),
                  ClientCard(),
                  ClientCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Expanded(
                  child: ListTile(
                title: Text("Total Paiement"),
                subtitle: Text("Semaine"),
              )),
              Expanded(
                  child: ElevatedButton(
                child: const Text(
                  '2.000.200 FCFA',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.red,
                ),
                onPressed: () {},
              )
                  // child: MaterialButton(
                  //   onPressed: null,
                  //   child: Text(
                  //     "Check out",
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                  )
            ]),
      ),
    );
  }
}
