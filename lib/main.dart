import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen.dart';




void main() async {
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark(),
      home:  MovieService(),
      

    );
  }
}