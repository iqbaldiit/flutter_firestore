import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_list.dart';
import 'adi_list.dart';

Future<void> main() async {
  // TODO Initialize the Firebase App
  WidgetsFlutterBinding.ensureInitialized();
//2
  await Firebase.initializeApp();

  //CollectionReference users = FirebaseFirestore.instance.collection('users');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const HomeList());
        home: const AdiList());
  }
}
