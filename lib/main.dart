
import 'package:backup/models/shop.dart';
import 'package:backup/pages/cart_page.dart';
import 'package:backup/pages/intro_page.dart';
import 'package:backup/pages/recognizing.dart';
import 'package:backup/pages/shop_page.dart';
import 'package:backup/pages/song.dart';
import 'package:backup/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=> Shop(),
    child: const MainApp() ,));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false,
     home: const IntroPage(),
     theme: lightmode,
     routes: {
      '/intro_page':(context) => const IntroPage(),
      '/shop_page':(context) => const ShopePage(),
      '/cart_page' :(context) => const CartPage(),
      '/recognizing' :(context) =>  Recognizer(),
      '/songpage' :(context)=> SongPage(),
     },

    );
  }
}
