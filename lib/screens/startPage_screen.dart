//create the first page of the application
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/onboard.png'),
            SizedBox(height: 60,),
            Image.asset('assets/images/text.png'),
            SizedBox(height: 30,),
            Text("Take notes anywhere!!", style: TextStyle(fontSize: 18),),
            SizedBox(height: 60,),


            //button for routing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFA5B500),
                      Color(0xFF778B04),
                      Color(0xFF103202),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                    ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 25),
                                backgroundColor: Colors.transparent
                               ),
                    onPressed: (){
                    Navigator.push(
                      context,
                       MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  },
                   child: Text('Get Started', style: TextStyle(fontSize: 20, color: Colors.white),),
                   ),
                ),
              ],
            )
      
          ],
        ),),
    );
  }
}