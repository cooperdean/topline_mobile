import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text( "TopSix", 
          style: TextStyle( 
            color: Colors.white, 
            fontFamily: "Chivo", 
            fontStyle: FontStyle.italic,
            fontSize: 32
          ) 
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only( top:20, left:20, bottom: 20 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text( "Contact", 
                  style:( TextStyle(
                      color: Colors.white,               
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1 
                    )
                  ) 
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric( horizontal:20 ),
            height: 50,
            child: Text( 
              "For all inquiries do not hesitate to use the contact information below:",
              style: TextStyle( 
                  color: Colors.white,
                  fontSize: 16.0,
              )
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: FaIcon( FontAwesomeIcons.solidAddressCard, color: Colors.white, size: 85, )
              ),
              Container(
                padding: EdgeInsets.symmetric( vertical:20 ),
                child: Text(
                  "Cooper Dean\ngithub.com/cooperdean\ncooperdean30@gmail.com\n1-306-768-8712",
                  style: TextStyle( 
                    color: Colors.white,
                    fontSize: 17,
                  )
                )
              ),
            ],
          )
        ]
      )
    );
  }
}