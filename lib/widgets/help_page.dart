import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ Color(0xFF202744), Color(0xFF131729) ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text( "TopSix", 
              style: TextStyle( 
                color: Colors.white, 
                fontFamily: "Chivo", 
                fontStyle: FontStyle.italic,
                fontSize: 40
              ) 
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),      
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only( top:20, left:20, bottom: 20 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    child: FaIcon( FontAwesomeIcons.solidAddressCard, color: Colors.white, size: 55, )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric( vertical:20 ),
                    child: Text(
                      "Cooper Dean\ngithub.com/cooperdean\ninfo@topsix.com",
                      style: TextStyle( 
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic
                      )
                    )
                  ),
                ],
              ),
                        Padding(
                padding: const EdgeInsets.only( top:20, left:20 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text( "Disclaimer", 
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: FaIcon( FontAwesomeIcons.exclamationCircle, color: Colors.white, size: 45, )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric( vertical:20 ),
                    child: Text(
                  "The information displayed\non TopSix does not represent\nactual team rosters, only\npredictions.",
                      style: TextStyle( 
                        color: Colors.white,
                        fontSize: 17,
                        fontStyle: FontStyle.italic
                      )
                    )
                  ),
                ],
              )
            ]
          )
        )
      ]
    );
  }
}