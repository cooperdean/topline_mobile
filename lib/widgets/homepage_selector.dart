import 'package:flutter/material.dart';
import 'package:topline/line_updates.dart';
import 'package:topline/widgets/standings.dart';

import '../lines_tab.dart';

class HomePageSelector extends StatefulWidget {
  @override
  _HomePageSelectorState createState() => _HomePageSelectorState();
}

class _HomePageSelectorState extends State<HomePageSelector> {
  final List<String> pageCats = ['All Teams', 'Updates', 'Standings'];
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
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: Column(
                                children: [
                                  Text(pageCats[index],
                                      style: TextStyle(
                                          fontStyle: index == selectedIndex
                                              ? FontStyle.italic
                                              : FontStyle.normal,
                                          color: index == selectedIndex
                                              ? Colors.white
                                              : Colors.white24,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                      height: 3,
                                      decoration: BoxDecoration(
                                          color: index == selectedIndex
                                              ? Color(0xFFc8102e)
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      );
                    })),
            if (selectedIndex == 0) LinesTab(),
            if (selectedIndex == 1) LineUpdatesTab(),
            if (selectedIndex == 2) LeagueStandings(),
          ],
        ),
      ),
    );
  }
}
