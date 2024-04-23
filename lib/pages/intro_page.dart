import 'package:backup/components/my_button.dart';
import 'package:flutter/material.dart';



class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:Center(
       child :Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          

         //logo
          Image.asset('images/harmonico.logo.png'),
          SizedBox(height: 25,),




          //title
          Text("Harmonico", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          SizedBox(height: 10,),



          //button
          MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page'), child: Icon(Icons.arrow_forward))



      

      ]),
      )
    );
  }
}