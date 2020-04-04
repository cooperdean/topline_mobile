import 'package:flutter/material.dart';
import 'package:topline/line_updates.dart';
import 'package:topline/widgets/standings.dart';

import '../lines_tab.dart';

class HomePageSelector extends StatefulWidget {
  @override
  _HomePageSelectorState createState() => _HomePageSelectorState();
}

class _HomePageSelectorState extends State<HomePageSelector> {

  final List<String> pageCats = ['Rosters & Gamelogs', 'League Standings','Line Updates'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Container(
                height: 60,
                color: Colors.transparent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pageCats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState( () {
                          selectedIndex = index;
                          }
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pageCats[index],
                              style: TextStyle(
                                fontStyle: index == selectedIndex ? FontStyle.italic : FontStyle.normal,
                                color: index == selectedIndex ? Colors.white : Colors.white38,
                                fontSize: 19.5,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:4.0),
                              child: Container(
                                width: 100,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: index == selectedIndex ? Color(0xFFc8102e) : Colors.transparent,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    );
                  }
                )
              ),
              if( selectedIndex == 0 ) LinesTab(),
              if( selectedIndex == 1 ) LeagueStandings(),
              if( selectedIndex == 2 ) LineUpdatesTab()
            ],
          ),
        ),
    );
  }
}