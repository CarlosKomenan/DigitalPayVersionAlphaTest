// ignore_for_file: file_names, prefer_const_constructors, override_on_non_overriding_member, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:digitalpay/Pages/BilanS.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Bilan extends StatefulWidget {
  const Bilan({Key? key}) : super(key: key);

  @override
  State<Bilan> createState() => _BilanState();
}

class _BilanState extends State<Bilan> {
  Widget Option(String name) {
    return Material(
      elevation: 3,
      color: Colors.amber[600],
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 70,
        onPressed: () async {
          setState(() {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => BilanSemaine()));
          });
        },
        child: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          tooltip: 'Retour',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        title: Text(
          'Votre bilan',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Option("Journalier"),
              SizedBox(
                height: 50,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BilanSemaine()));
                  },
                  child: Option("Semaine")),
              SizedBox(
                height: 50,
              ),
              Option("Mois"),
              SizedBox(
                height: 50,
              ),
              Option("Annuel"),
              SizedBox(
                height: 50,
              ),
              Option("Personnalisé")
            ],
          ),
        ),
      ),
    );
  }
}
