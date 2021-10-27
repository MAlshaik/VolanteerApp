import 'dart:io';

import 'package:flutter/material.dart';
import 'package:VolanteerApp/custom/BorderIcon.dart';
import 'package:VolanteerApp/custom/OptionButton.dart';
import 'package:VolanteerApp/sample_data.dart';
import 'package:VolanteerApp/screens/DetailPage.dart';
import 'package:VolanteerApp/screens/LandingPage.dart';
import 'package:VolanteerApp/utils/constants.dart';
import 'package:VolanteerApp/utils/widget_functions.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState<T extends ProfilePage> extends State<T> {
  File image;

  @override
  void initState(){
    super.initState();
    image = image;
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveImagePermanetly(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanetly(String imagePath) async {
     final directory = await getApplicationDocumentsDirectory();
     final name = basename(imagePath);
     final image = File('${directory.path}/$name');
     setState(() {
       this.image = File(image.path);
     });

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/image_pink.jpg'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitHeight
                
                
              )
              
            ),
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderIcon(
                          height: 50,
                          width: 50,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              padding: EdgeInsets.zero,
                              color: COLOR_BLACK,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LandingPage()));
                              }),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(20),
                  Padding(
                    padding: sidePadding,
                    child: Center(child: Text(
                      "PROFILE",
                      style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                      
                    ),
                    ),
                  ),
                  
                  addVerticalSpace(20),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25.0),
                                      child: image != null
                                          ? Image.file(
                                              image,
                                              width: 400,
                                              height: 400,
                                              fit: BoxFit.cover,
                                            )
                                          : BorderIcon(
                                              height: 400,
                                              width: 400,
                                              child: IconButton(
                                                icon: Icon(Icons.add),
                                                iconSize: 100,
                                                color: Color.fromARGB(
                                                    240, 220, 220, 220),
                                                onPressed: () => pickImage(ImageSource.gallery),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
