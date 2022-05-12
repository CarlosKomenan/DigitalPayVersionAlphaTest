// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, deprecated_member_use, unused_local_variable, unused_element, dead_code, nullable_type_in_catch_clause, non_constant_identifier_names, avoid_print

import 'package:digitalpay/Pages/loading.dart';
import 'package:flutter/material.dart';

import '../Widgets/OperationCard.dart';
import 'Home.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Operation extends StatefulWidget {
  const Operation({Key? key}) : super(key: key);

  @override
  State<Operation> createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  final TextEditingController montantController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  void Connexion(String montant, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        // await _auth
        //     .signInWithEmailAndPassword(email: email, password: password)
        //     .then((uid) => {
        //           Fluttertoast.showToast(msg: "Vous êtes connecté"),
        //           // Navigator.of(context).pushReplacement(
        //           //     MaterialPageRoute(builder: (context) => HomeScreen())),
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Loading()),
            (route) => false);
        // } on FirebaseAuthException catch (e) {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text(e.message.toString()),
        //     backgroundColor: Colors.red,
        //   ));
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    Future openDialog(String name) => showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Text(name),
              content:
                  // isLoading
                  //     ? TweenAnimationBuilder(
                  //         tween: Tween(begin: 0.0, end: 1.0),
                  //         duration: Duration(seconds: 4),
                  //         builder: (context, value, _) => SizedBox(
                  //               width: 50,
                  //               height: 50,
                  //               child: CircularProgressIndicator(
                  //                 value: 0.5,
                  //                 backgroundColor: Colors.blue,
                  //                 strokeWidth: 8,
                  //               ),
                  //             ))
                  SafeArea(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: TextFormField(
                    controller: montantController,
                    onSaved: (value) {
                      montantController.text = value!;
                    },
                    validator: (value) {
                      //champ vide
                      if (value!.isEmpty) {
                        return "Veuillez renseigner le champ svp";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Entrer le montant',
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    autofocus: true,
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("ANNULER")),
                TextButton(
                    onPressed: () async {
                      if (isLoading) return;
                      setState(() => isLoading = true);
                      await Future.delayed(Duration(seconds: 0), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      setState(() {
                        // var val = montantController.toString();
                        Connexion(montantController.text, context);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Loading()));
                      });
                      // Future.delayed(Duration(seconds: 2), () {
                      //   TweenAnimationBuilder(
                      //       tween: Tween(begin: 0.0, end: 1.0),
                      //       duration: Duration(seconds: 4),
                      //       builder: (context, value, _) => SizedBox(
                      //             width: 50,
                      //             height: 50,
                      //             child: CircularProgressIndicator(
                      //               value: 0.5,
                      //               backgroundColor: Colors.blue,
                      //               strokeWidth: 8,
                      //             ),
                      //           ));
                      // });
                    },
                    child: Text("VALIDER"))
              ],
            ));
    // bool isLoading = false;
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
          'Paiement',
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(width: 25),
                  Text(
                    "Patienter svp...",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Paiement en ligne",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Selectionner le mode de paiement",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      openDialog("Carte de crédit");
                    },
                    child: Container(
                      width: 370,
                      height: 230,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 25.0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //     colors: [Colors.amber, Color(0xff47BA79), Colors.yellow]),
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/card/bank2.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Stack(
                        children: [
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Cliquez ici \n",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "Pour choisir ce mode de paiement \n",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            )
                          ]))
                        ],
                      ),
                      // child: Padding(
                      //   padding: EdgeInsets.only(left: 17, right: 17, top: 20),
                      //   child: Container(
                      //     height: 200,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Text("Cliquez ici pour choisir ce mode de paiment"),
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //       image: ExactAssetImage("assets/card/bank2.png"),
                      //       fit: BoxFit.fitHeight,
                      //     )),
                      //   ),
                      // ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 13, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Opérations",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 9,
                              width: 9,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 9,
                              width: 9,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 9,
                              width: 9,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 9,
                              width: 9,
                              margin: EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 170,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                openDialog("Orange money");
                              },
                              child: OperationCard(
                                name: "Orange Money",
                                img: Image.asset(
                                  "assets/orange.png",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fitWidth,
                                ),
                                decor: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.amberAccent,
                                        Colors.white10,
                                        Colors.amberAccent,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                openDialog("Mtn mobile Money");
                              },
                              child: OperationCard(
                                name: "Mtn Money",
                                img: Image.asset(
                                  "assets/mtn.jpg",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fitWidth,
                                ),
                                decor: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                openDialog("Moov money");
                              },
                              child: OperationCard(
                                name: "Moov Money",
                                img: Image.asset(
                                  "assets/moov2.jpg",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fitWidth,
                                ),
                                decor: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    // gradient: LinearGradient(colors: [
                                    //   Colors.amberAccent,
                                    //   Colors.white10,
                                    //   Colors.amberAccent,
                                    // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                openDialog("Carte de crédit");
                              },
                              child: OperationCard(
                                name: "Carte credit",
                                img: Image.asset(
                                  "assets/card/bank2.png",
                                  height: 80,
                                  width: 100,
                                  fit: BoxFit.fitWidth,
                                ),
                                decor: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    // gradient: LinearGradient(colors: [
                                    //   Colors.amberAccent,
                                    //   Colors.white10,
                                    //   Colors.amberAccent,
                                    // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                                    color: Colors.white),
                              ),
                            ),
                          ])),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Center(
                      child: Text(
                        "Copyright © 2022 \n",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Center(
                      child: Text(
                        "Version 1.0 24/04/2022 \n",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}



// class Operation extends StatelessWidget {
//   const Operation({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Future openDialog() => showDialog(
//         context: context,
//         builder: (builder) => AlertDialog(
//               title: Text("Carte de crédit"),
//               content: TextField(
//                 decoration: InputDecoration(
//                     hintText: 'Entrer le montant',
//                     border: OutlineInputBorder()),
//                 keyboardType: TextInputType.number,
//                 autofocus: true,
//               ),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text("ANNULER")),
//                 TextButton(
//                     onPressed: () => {},
//                     child: InkWell(
//                         onTap: () {
//                           // Future.delayed(Duration(seconds: 2), () {
//                           //   TweenAnimationBuilder(
//                           //       tween: Tween(begin: 0.0, end: 1.0),
//                           //       duration: Duration(seconds: 4),
//                           //       builder: (context, value, _) => SizedBox(
//                           //             width: 50,
//                           //             height: 50,
//                           //             child: CircularProgressIndicator(
//                           //               value: 0.5,
//                           //               backgroundColor: Colors.blue,
//                           //               strokeWidth: 8,
//                           //             ),
//                           //           ));
//                           // });
//                         },
//                         child: Text("VALIDER"))),
//               ],
//             ));
//     bool isLoading = false;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber[600],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new_outlined),
//           tooltip: 'Retour',
//           onPressed: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => Home()));
//           },
//         ),
//         title: Text(
//           'Paiement',
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: 30,
//                     ),
//                     Text(
//                       "Paiement en ligne",
//                       style: TextStyle(
//                           color: Colors.orange,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: 30,
//                     ),
//                     Text(
//                       "Selectionner le mode de paiement",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: 370,
//               height: 230,
//               padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
//               decoration: BoxDecoration(
//                 // gradient: LinearGradient(
//                 //     colors: [Colors.amber, Color(0xff47BA79), Colors.yellow]),
//                 borderRadius: BorderRadius.circular(20.0),
//                 image: DecorationImage(
//                   image: AssetImage(
//                     "assets/card/bank2.png",
//                   ),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   RichText(
//                       text: TextSpan(children: <TextSpan>[
//                     TextSpan(
//                       text: "Cliquez ici \n",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     TextSpan(
//                       text: "Pour choisir ce mode de paiement \n",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 17,
//                       ),
//                     )
//                   ]))
//                 ],
//               ),
//               // child: Padding(
//               //   padding: EdgeInsets.only(left: 17, right: 17, top: 20),
//               //   child: Container(
//               //     height: 200,
//               //     width: MediaQuery.of(context).size.width,
//               //     child: Text("Cliquez ici pour choisir ce mode de paiment"),
//               //     decoration: BoxDecoration(
//               //         image: DecorationImage(
//               //       image: ExactAssetImage("assets/card/bank2.png"),
//               //       fit: BoxFit.fitHeight,
//               //     )),
//               //   ),
//               // ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 16, bottom: 13, top: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Text(
//                         "Opérations",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         height: 9,
//                         width: 9,
//                         margin: EdgeInsets.only(right: 10),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.amber,
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         height: 9,
//                         width: 9,
//                         margin: EdgeInsets.only(right: 10),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         height: 9,
//                         width: 9,
//                         margin: EdgeInsets.only(right: 10),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         height: 9,
//                         width: 9,
//                         margin: EdgeInsets.only(right: 30),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.black,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//                 height: 170,
//                 margin: EdgeInsets.symmetric(horizontal: 30),
//                 child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       OperationCard(
//                         name: "Orange Money",
//                         service: "Orange Money",
//                         img: Image.asset(
//                           "assets/orange.png",
//                           height: 80,
//                           width: 80,
//                           fit: BoxFit.fitWidth,
//                         ),
//                         decor: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.black,
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(15),
//                           ),
//                           gradient: LinearGradient(
//                               colors: [
//                                 Colors.amberAccent,
//                                 Colors.white10,
//                                 Colors.amberAccent,
//                               ],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       OperationCard(
//                         name: "Mtn Money",
//                         service: "Mtn Money",
//                         img: Image.asset(
//                           "assets/mtn.jpg",
//                           height: 80,
//                           width: 80,
//                           fit: BoxFit.fitWidth,
//                         ),
//                         decor: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black,
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                             color: Colors.white),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       OperationCard(
//                         name: "Moov Money",
//                         service: "Moov Money",
//                         img: Image.asset(
//                           "assets/moov2.jpg",
//                           height: 80,
//                           width: 80,
//                           fit: BoxFit.fitWidth,
//                         ),
//                         decor: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black,
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                             // gradient: LinearGradient(colors: [
//                             //   Colors.amberAccent,
//                             //   Colors.white10,
//                             //   Colors.amberAccent,
//                             // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                             color: Colors.white),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       OperationCard(
//                         name: "Carte credit",
//                         service: "Carte credit",
//                         img: Image.asset(
//                           "assets/card/bank2.png",
//                           height: 80,
//                           width: 100,
//                           fit: BoxFit.fitWidth,
//                         ),
//                         decor: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black,
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                             // gradient: LinearGradient(colors: [
//                             //   Colors.amberAccent,
//                             //   Colors.white10,
//                             //   Colors.amberAccent,
//                             // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                             color: Colors.white),
//                       ),
//                     ])),
//             SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Center(
//                 child: Text(
//                   "Version 24.04.2022 Flutter",
//                   style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
