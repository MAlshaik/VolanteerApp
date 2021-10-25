import 'package:flutter/material.dart';
import 'package:VolanteerApp/screens/FadeAnimation.dart';
import 'dart:async';

import 'package:VolanteerApp/screens/HomePage.dart';
import 'package:VolanteerApp/utils/widget_functions.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,home:SplashScreen()));

class SplashScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 80, 170, 170),
      body:
      	 Container(
	        child: Column(
	          children: <Widget>[
              Container(
                height: 731,
                decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/images/hands.jpg'),
                alignment: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                
                left: 55,
                width: 300,
                height: 650,
                
                child:  Container(
                  
                  decoration: 
                  BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/MakeADiff.png'),
                            
                            
                  )
                )
                )
                
              ),
              
              Positioned(
               left: 150,
               top: MediaQuery.of(context).size.height/2,
                child: 
                 FadeAnimation(1,Container(
                  alignment: Alignment.bottomCenter,
                 child: SizedBox(
                height: 43,
                width: 100,
                child: TextButton(
                  onPressed: () {
                    // should finalise the listing and add it to the main page (needs to be done)
                     Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                  },
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 158, 61)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 14)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ))),
                      child: Text("Continue"),
                )
            ),
                 )
              )
              )
            ],
          ),
        
      )
            ]
          )
          
          
        )
      
      
    );
           
    
  } 
}


// class _SplashScreenState extends State<SplashScreen> {
//   Timer _timer;
//   FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

//   _SplashScreenState() {
//     _timer = new Timer(const Duration(milliseconds: 800), () {
//        setState(() {
//         _logoStyle = FlutterLogoStyle.horizontal;
//       });
//     Navigator.push(                      //<-- Navigate to loginPage on Timeout
//     context,
//     MaterialPageRoute(builder: (context) => HomePage()),
//   );
//     });
//   }