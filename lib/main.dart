import 'package:favourite_app/provider/favourite_provider.dart';
import 'package:favourite_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> FavouriteProvider(),
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: ThemeData(scaffoldBackgroundColor: Colors.white
     
     ),
      home: const  HomePage(),
    ),
    
    );
    
  }
}
