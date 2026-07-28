import 'package:flutter/material.dart';
import './home_Page.dart';
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/onboard.png'),
            Image.asset('assets/images/text.png'),
            Text('take notes anywhere'),

            SizedBox(height: 60,),

            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => homePage()));
            },
             child: Text('Get started'))
          ],
        ),
      ),
    );
  }
}