
import 'package:flutter/material.dart';
import 'package:VolanteerApp/screens/LandingPage.dart';
import 'FadeAnimation.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/images/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  // Positioned(
	                  //   left: 30,
	                  //   width: 80,
	                  //   height: 200,
	                  //   child: FadeAnimation(1, Container(
	                  //     decoration: BoxDecoration(
	                  //       image: DecorationImage(
	                  //         image: AssetImage('assets/images/light-1.png')
	                  //       )
	                  //     ),
	                  //   )),
	                  // ),
	                  // Positioned(
	                  //   left: 140,
	                  //   width: 80,
	                  //   height: 150,
	                  //   child: FadeAnimation(1.3, Container(
	                  //     decoration: BoxDecoration(
	                  //       image: DecorationImage(
	                  //         image: AssetImage('assets/images/light-2.png')
	                  //       )
	                  //     ),
	                  //   )),
	                  // ),
	                  // Positioned(
	                  //   right: 40,
	                  //   top: 40,
	                  //   width: 80,
	                  //   height: 150,
	                  //   child: FadeAnimation(1.5, Container(
	                  //     decoration: BoxDecoration(
	                  //       image: DecorationImage(
	                  //         image: AssetImage('assets/images/clock.png')
	                  //       )
	                  //     ),
	                  //   )),
	                  // ),
	                  Positioned(
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  )
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                  FadeAnimation(1.8, Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromARGB(143,  80, 170, 170),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Email or Phone number",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          child: TextField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Password",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        )
	                      ],
	                    ),
	                  )),
	                  SizedBox(height: 30,),
	                  FadeAnimation(2, Container(
	                    height: 50,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromARGB(255,  80, 170, 170),
	                          Color.fromARGB(255,  80, 170, 170),
	                        ]
	                      )
	                    ),
	                    child: Center(
	                      child: TextButton(
                          onPressed: (){  
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
                          },
                           style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255,  80, 170, 170)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 14)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontWeight: FontWeight.bold,
                      ))),
                      child: Text("Login"),
                          
                          ),
	                    ),
	                  )),
	                  SizedBox(height: 70,),
	                  
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
}