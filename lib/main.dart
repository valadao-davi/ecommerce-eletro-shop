import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UserController()),
        ChangeNotifierProvider(create: (context)=> ProductController()),
      ],
      child: const MaterialApp(
        title: "Ecommerce Apple",
        home: HomePage(),
      ),
    );
  }
}
