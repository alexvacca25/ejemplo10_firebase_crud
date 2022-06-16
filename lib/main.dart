import 'package:ejemplo10_firebase_crud/Pantallas/lista2.dart';
import 'package:ejemplo10_firebase_crud/Pantallas/login/login.dart';
import 'package:ejemplo10_firebase_crud/controller/firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pantallas/lista.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Peticiones2());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Programacion Movil',
      theme: ThemeData.light(),
      home: //ListaMensajeros2(title: 'I'),
          ListaMensajeros(
              title:
                  'Proyecto Mensajeros'), //ListaMensajeros() //ListaMensajeros(title: 'Proyecto Mensajeros'),*/
    );
  }
}
