import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=> CartProvider() ,
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1)),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                
              )
            ),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.black
              )
            ),
            textTheme: const TextTheme(
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              bodySmall: TextStyle(
                fontWeight:  FontWeight.bold,
                fontSize: 15
              )
            ),
            useMaterial3: true
            ),
          
      
        home:  const HomePage(),
      ),
    );
  }
}
