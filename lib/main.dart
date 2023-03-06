import 'package:bookstore/utils/routes/route_names.dart';
import 'package:bookstore/utils/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: RoutesName.home, 
      onGenerateRoute: Routes.generateRoute,
     
     
      );
  }
}

