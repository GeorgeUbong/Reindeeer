import 'package:flutter/material.dart';
import 'package:reindeer/views/Home.dart';

void main(){
  runApp(Onboard());
}

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Image.asset(
                'assets/images/onboard.png',
                fit: BoxFit.contain,
              ),
              Spacer(),
              //Title
              Image.asset(
                'assets/images/text.png',
                width: 180,
              ),
              SizedBox(height: 14,),
                 Text("Take notes everywhere",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
                ), ),
              SizedBox(height: 50,),

              //CTA
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 24, 97, 26),
                  padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.5)
                ),
                onPressed: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const HomeScreen()));
                }, 
              child: Text("Get started",
               style: 
               TextStyle(
                color: Colors.white,
               fontSize: 22
               ),
               )
               ),
                ],
              ),
              
            ],
            
          ),
          
                ),
        ),)
     )
    ); //C:\Users\DELL\Documents\ubong\Mobile Apps\reindeer\assets\images\onboard.png
    
  }
}