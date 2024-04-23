import 'package:backup/components/my_list_tile.dart';
import 'package:flutter/material.dart';
 class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header; logo
          Column(
            children: [
              DrawerHeader(
            child:
            Center(child: Image.asset('images/harmonico.logo.png')) 
            ),
             const SizedBox(),

          //shop tile
          MyListTile(
            text: 'Shop',
            icon: Icons.home,
            onTap: ()=> Navigator.pop(context),
          
          ),

           MyListTile(
            text: 'Cart',
            icon: Icons.shopping_cart,
            onTap: (){
              Navigator.pop(context);

              Navigator.pushNamed(context, '/cart_page');
            } ,
          ),

          MyListTile(
            text: 'Recognizer',
            icon: Icons.music_note_sharp,
            onTap: (){
              Navigator.pop(context);

              Navigator.pushNamed(context, '/recognizing');
            } ,

            
          
          ),
            ],
          ),

           Padding(
             padding: const EdgeInsets.only(bottom: 25.0),
             child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(context,'/intro_page', (route)=> false),
                       
                       ),
           )


          //cart tile

          //exit



        ]),
    );
  }
}