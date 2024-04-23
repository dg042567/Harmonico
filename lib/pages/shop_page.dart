import 'package:backup/components/my_button.dart';
import 'package:backup/components/my_drawer.dart';
import 'package:backup/components/my_product_tile.dart';
import 'package:backup/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopePage extends StatelessWidget {
  const ShopePage
  ({super.key});

  @override
  Widget build(BuildContext context) {
    //access prods in shop
    final products= context.watch<Shop>().shop;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:const Text('Harmonico'),

        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyButton(onTap: () => Navigator.pushNamed(context, '/recognizing'),
            child: Icon(Icons.music_note_sharp)),
          )
          

        ],


        
        ),
        drawer: MyDrawer(),

        body:ListView(

          children: [
            const SizedBox(height: 25,),
            
            //title
            Center(
              child: Text(
                "Top picks",
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary )
                
                
                ,
              ),
            ),

            //prod list

             SizedBox(
          height: 550,
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index){
              
              //get indi prods
              final product = products[index];
          
          
          
              //return as prod tile ui
              return MyProducts(product: product);
          
          
            }),
        )
          ]
          
        )
        );
  }
}