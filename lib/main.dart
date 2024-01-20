import 'package:attende/page1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAwNvG4qirJn180a3MYjbxbatL48-oxIWM",
          appId: "1:498610019139:android:a3d4dc56d8d692d145edf6",
          messagingSenderId:"498610019139",
          projectId: "attende-24825")
  );
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance app',
      home: page1(),
    );
  }
}
