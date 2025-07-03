import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA0hZs_VPzAO26Ik_0on-muyfkBI7_Bjao",
      authDomain: "confessionwall-64ba3.firebaseapp.com",
      projectId: "confessionwall-64ba3",
      storageBucket: "confessionwall-64ba3.appspot.com",
      messagingSenderId: "486388966685",
      appId: "1:486388966685:web:a4aba2056a84a8cfe4adf4",
    ),
  );
  runApp(const ConfessionWallApp());
}

class ConfessionWallApp extends StatelessWidget {
  const ConfessionWallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Confession Wall',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomePage(),
    );
  }
}
