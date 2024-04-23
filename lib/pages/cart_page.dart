import 'package:backup/components/my_button.dart';
import 'package:backup/models/product.dart';
import 'package:backup/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart (BuildContext context, Product product) {
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        content: Text("Remove this item from cart?"),
        actions: [
          MaterialButton(
            onPressed: () =>Navigator.pop(context),
            child: Text("Cancel"),
            ),

          MaterialButton(
            onPressed: () {

              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
              },
            child: Text("Yes"),
            )


        ],
      ));

      
  
  }

   void payButtonPressed(BuildContext context){
        showDialog(
          context: context,
          builder: (context)=> AlertDialog(
            content: Text("connect to backend")

          ),);

      }

  @override
  Widget build(BuildContext context) {

    final cart= context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:const Text('Your Cart'),
        
    ),
    body: Column(
      children: [
        Expanded(
          child: cart.isEmpty? const Center(child:   Text('cart is empty'),) :
          ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, Index){
            final Item= cart[Index];

            return ListTile(
              title: Text(Item.name),
              subtitle: Text(Item.price.toStringAsFixed(2)),
              trailing: IconButton(
                icon: const Icon (Icons.remove),
                onPressed:() => removeItemFromCart(context, Item),

                ),
            );
          })
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap:()=> payButtonPressed(context),
              child: Text("Pay now!")),
          )

      ],
    )
    
    );
  }
}