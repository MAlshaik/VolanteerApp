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

class AddPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
          body: Container(
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
                  child: Text(
                    "New Listing",
                    style: themeData.textTheme.headline1,
                  ),
                ),
                Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: 25,
                      color: COLOR_GREY,
                    )),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                ),
                addVerticalSpace(20),
                
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return AddItem(
                            itemData: RE_DATA[index],
                          );
                        }),
                  ),
                ),

                addVerticalSpace(10),
                
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class AddItem extends StatefulWidget {
  final dynamic itemData;

  static TextEditingController titleController = new TextEditingController();
  static TextEditingController descriptionController = new TextEditingController();

  String description = '';
  String title = '';
  

  AddItem({Key key, this.itemData}) : super(key: key);
  File image;

  Future pickImage() async {
    
  try{
   final image =  await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

   
    final imageTemporary = File(image.path);
    // setState(() => this.image = imageTemporary);
    
  } on PlatformException catch (e) {
    print('Failed to pick image: $e');
  }
    
  }
  

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    //this is to sense if I clicked the add image button or not (needs to be changed to be able to actually add an image)
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  itemData: itemData,
                )));
      },
    child:
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                  "  Add Image ",
                   style: themeData.textTheme.subtitle1
                  ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child:
                image != null ? Image.file(image, width: 400, height: 400, fit: BoxFit.cover,) : 
                   BorderIcon(
                    height: 200,
                    width: 400,
                    child: IconButton(icon: Icon(Icons.add), iconSize: 100, color: Color.fromARGB(240, 220, 220, 220), onPressed: () => pickImage(),)
                    // Icon(Icons.add,
                    //     size: 100, color: Color.fromARGB(240, 220, 220, 220)),
                  ),
                 
                ),
                
              ],
            ),
           
            addVerticalSpace(35),
            TextField(
              controller: titleController,
              decoration: InputDecoration( 
                enabledBorder: OutlineInputBorder( 
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color.fromARGB(240, 220, 220, 220))
                ), 
                focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5),
                 borderSide:  BorderSide(color: Color.fromARGB(240, 220, 220, 220))
                ),
                labelText: 'Title', 
                ),
              onEditingComplete: (){
                title = titleController.text;
                FocusScope.of(context).unfocus();
                },
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
            ),


            addVerticalSpace(20),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration( 
                contentPadding: const EdgeInsets.only(left: 10, right: 100, top: 100, bottom: 100),
                enabledBorder: OutlineInputBorder( 
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color.fromARGB(240, 220, 220, 220))
                ), 
                focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5),
                 borderSide:  BorderSide(color: Color.fromARGB(240, 220, 220, 220))
                ),
                labelText: 'Description', 
                ),
              onEditingComplete: (){
                description = descriptionController.text;
                FocusScope.of(context).unfocus();
                },
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
            ),
            addVerticalSpace(35),

            SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // should finalise the listing and add it to the main page (needs to be done)
                     Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 3, 107, 252)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 14)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ))),
                      child: Text("Create Listing"),
                )
            ),


            
            
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
