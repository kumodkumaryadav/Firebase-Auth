import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/widget_tree.dart';
import 'package:flutter/material.dart';

Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //initnializong firebase to the project before running 
  await Firebase.initializeApp(); 
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home:  WidgetTree(),
    );
  }
}
