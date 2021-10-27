import 'package:VolanteerApp/screens/ProfilePage.dart';
import 'package:VolanteerApp/screens/UserPage.dart';
import 'package:flutter/material.dart';
import 'package:VolanteerApp/custom/BorderIcon.dart';
import 'package:VolanteerApp/custom/OptionButton.dart';
import 'package:VolanteerApp/sample_data.dart';
import 'package:VolanteerApp/screens/AddPage.dart';
import 'package:VolanteerApp/screens/DetailPage.dart';
import 'package:VolanteerApp/utils/constants.dart';
import 'package:VolanteerApp/utils/widget_functions.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

      
            

     return SafeArea(
      child: Scaffold(
          body: 
          Container(
             decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/image_pink.jpg'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth
                
                
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
                          icon: Icon(Icons.perm_identity, color: COLOR_BLACK,), padding: EdgeInsets.zero, 
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: 
                            (context) => UserPage()
                            ));
                          },
                        ),
                      ),
                      
                       BorderIcon(
                        height: 50,
                        width: 50,
                        child: 
                        IconButton(
                          icon: Icon(Icons.add),
                          padding: EdgeInsets.zero,
                          color: COLOR_BLACK,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: 
                            (context) => AddPage()
                            ));
                         }
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(20),
                
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "Volanteer Projects ",
                    style: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 26),
                    
                  ),
                ),
                Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: 25,
                      color: COLOR_GREY,
                    )),
                addVerticalSpace(10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  
                ),
                addVerticalSpace(10),
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealEstateItem(
                            itemData: RE_DATA[index],
                          );
                        }),
                  ),
                ),
              ],
            ),
            
          ],
        ),
          ),
      ));     
            
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  itemData: itemData,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(25.0), child: Image.asset(itemData["image"])),
                
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "${(itemData["title"])}",
                  style: themeData.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                
              ],
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["address"]}",
              style: themeData.textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
