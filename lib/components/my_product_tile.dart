import 'package:backup/models/product.dart';
import 'package:backup/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProducts extends StatelessWidget {
  final  Product product;


  const MyProducts({super.key, required this.product,});

  //add to cart
  void addToCart (BuildContext context) {
    //show dialogue box
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        content: Text("Add this item to cart?"),
        actions: [
          MaterialButton(
            onPressed: () =>Navigator.pop(context),
            child: Text("Cancel"),
            ),

          MaterialButton(
            onPressed: () {

              Navigator.pop(context);

              context.read<Shop>().addToCart(product);
              },
            child: Text("Yes"),
            )


        ],
      ));
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.secondary,
              ),
              padding: EdgeInsets.all(25),
              width: double.infinity,
              child: Image.asset(product.imagePath)),
          ),
          const SizedBox(height: 25,),


          //prod name
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),

            const SizedBox(),

          //descrip
          Text(product.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),


            ],
          ),
          const SizedBox(height: 25,),
          //product image

          
          //price+ add o cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$'+product.price.toStringAsFixed(2)),

              //add to cart
              
              Container(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: IconButton(
                onPressed: () => addToCart(context),
                icon: Icon(Icons.add)),
              )
            ],
          ),




      ]),
    );
  }
}