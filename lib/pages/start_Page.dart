import 'package:flutter/material.dart';
import './home_Page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset('assets/images/onboard.png', width: 350),
              Spacer(),

              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/text.png', width: 180),
                      SizedBox(height: 10),

                      Text(
                        'take notes everywhere',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 100),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => homePage()),
                  );
                },
                child: Text('Get started', style: TextStyle(fontSize: 18)),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
