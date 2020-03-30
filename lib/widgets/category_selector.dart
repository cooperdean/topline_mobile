import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../functions.dart';
import '../lines_tab.dart';

class CategorySelector extends StatefulWidget {
  final TeamLine team;
  CategorySelector({Key key, @required this.team}) : super(key: key);
  _CategorySelectorState createState() => _CategorySelectorState();
}
class _CategorySelectorState extends State<CategorySelector>{

  final List<String> lineCats = ['Team Lineup', 'Forwards', 'Defense', 'Powerplay', 'Goalies', 'Injured'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) { 
    return Column(
      children: [ 

        Container(
          height: 60,
          color: Colors.transparent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lineCats.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState( () {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 14.0
                  ),
                  child: Text(
                    lineCats[index],
                    style: TextStyle(
                      color: index == selectedIndex ? Colors.white : Colors.white54,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2
                    )
                  )
                ),
              );
            }
          )
        ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(60),
              topLeft: Radius.circular(60)
            )
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(60), 
                topLeft:Radius.circular(60)
              ),
              child: ListView( 
              children: [
                Container( 
                  padding: EdgeInsets.only( top:30, bottom:20 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                        Column(
                          children: [ 
                              Image.network( 
                                "https://sportteamslogo.com/api?key=30fa25df759b495f8995bfb7dac527f9&size=big&tid="+getTeamLogo("${widget.team.team}"),
                                scale: 1.6,
                            ) 
                          ]
                        ),
                        Column(
                          children: [
                            Icon( Icons.update ),
                            Center( child: Text( 
                              "Updated at:",
                              style: TextStyle( fontSize: 16, color: Colors.grey )
                              ) 
                            ),
                            Center( child: Text( 
                                "${formatDate(widget.team.timestamp)}",
                                style: TextStyle( fontSize: 16 )
                              ) 
                            ) 
                          ]
                        ),
                      ],
                    )
                ),
                  if( selectedIndex==1 || selectedIndex==0 ) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding( padding: EdgeInsets.only( top: 50 ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "LW",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "C",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 )  ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "RW",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                    ],
                  ),
                  if( selectedIndex==1 || selectedIndex==0 ) GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1.3,
                    padding: const EdgeInsets.only( left: 20, right: 20, top: 30),
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                      Center ( child: Column ( children: [
                            Container( child: Text( "LW1 - #${widget.team.l1lw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l1lw[0]}",textAlign: TextAlign.center , ) )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "C1 - #${widget.team.l1c[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l1c[0]}",textAlign: TextAlign.center , ) ) 
                          ]
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "RW1 - #${widget.team.l1rw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l1rw[0]}",textAlign: TextAlign.center , ) )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "LW2 - #${widget.team.l2lw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l2lw[0]}",textAlign: TextAlign.center , ) )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "C2 - #${widget.team.l2c[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l2c[0]}",textAlign: TextAlign.center , ) ) 
                          ]
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "RW2 - #${widget.team.l2rw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l2rw[0]}",textAlign: TextAlign.center , ) )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "LW3 - #${widget.team.l3lw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l3lw[0]}",textAlign: TextAlign.center , ) )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "C3 - #${widget.team.l3c[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l3c[0]}",textAlign: TextAlign.center , ) ) 
                          ]
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "RW3 - #${widget.team.l3rw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l3rw[0]}",textAlign: TextAlign.center , ) )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "LW4 - #${widget.team.l4lw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l4lw[0]}",textAlign: TextAlign.center , ) )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "C4 - #${widget.team.l4c[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l4c[0]}",textAlign: TextAlign.center , ) ) 
                          ]
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Container( child: Text( "RW4 - #${widget.team.l4rw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.l4rw[0]}",textAlign: TextAlign.center , ) )
                          ] 
                        ), 
                      ),
                    ],
                  ),
                  if( selectedIndex==2 || selectedIndex==0 ) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding( padding: EdgeInsets.only( top:50 ),),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "LD",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "RD",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 )  ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                    ],
                  ),
                  if( selectedIndex==2 || selectedIndex==0 ) GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 2.2,
                    padding: const EdgeInsets.only( left: 20, right: 20, top: 30 ),
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: [
                      Center ( child: Column( children: [ 
                            Container( child: Text( "DL1 - #${widget.team.d1l[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.d1l[0]}",textAlign: TextAlign.center ) ), 
                          ]
                        )
                      ),
                      Center ( child: Column( children: [ 
                            Container( child: Text( "D1R - #${widget.team.d1r[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.d1r[0]}",textAlign: TextAlign.center ) ), 
                          ]
                        )
                      ),
                      Center ( child: Column( children: [ 
                            Container( child: Text( "D2L - #${widget.team.d2l[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.d2l[0]}",textAlign: TextAlign.center ) ), 
                          ]
                        )
                      ),
                      Center ( child: Column( children: [ 
                            Container( child: Text( "D2R - #${widget.team.d2r[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.d2r[0]}",textAlign: TextAlign.center ) ), 
                          ]
                        )
                      ),
                      Center ( child: Column( children: [ 
                            Container( child: Text( "D3L - #${widget.team.d3l[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.d3l[0]}",textAlign: TextAlign.center ) ), 
                          ]
                        )
                      ),
                      Center ( child: Column( children: [ 
                            Container( child: Text( "D3R - #${widget.team.d3r[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.d3r[0]}",textAlign: TextAlign.center ) ), 
                          ]
                        )
                      ),
                    ],
                  ),
                  if( selectedIndex==3 || selectedIndex==0 ) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding( padding: EdgeInsets.only( top: 50 ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "Powerplay 1",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                    ],
                  ),
                  if( selectedIndex==3 || selectedIndex==0 ) GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1.3,
                    padding: const EdgeInsets.only( 
                      left: 20,
                      right: 20,
                      top: 40
                    ),
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                      Center ( child: Column ( children: [
                            Text( "PP1LW - #${widget.team.pp1lw[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp1lw[0]}",textAlign: TextAlign.center , )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Text( "PP1C - #${widget.team.pp1c[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp1c[0]}",textAlign: TextAlign.center , )
                          ]
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Text( "PP1RW - #${widget.team.pp1rw[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp1rw[0]}",textAlign: TextAlign.center , )
                          ] 
                        ), 
                      ),
                    ],
                  ),
                  if( selectedIndex==3 || selectedIndex==0 ) GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 3.5,
                    padding: const EdgeInsets.symmetric( horizontal: 20 ),
                    crossAxisSpacing: 0,
                    crossAxisCount: 2,
                    children: [
                      Center ( child: Column ( children: [
                            Text( "PP1LD - #${widget.team.pp1ld[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp1ld[0]}",textAlign: TextAlign.center , )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Text( "PP1RD - #${widget.team.pp1rd[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp1rd[0]}",textAlign: TextAlign.center , )
                          ]
                        ), 
                      ),
                    ],
                  ),
                  if( selectedIndex==3 || selectedIndex==0 ) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding( padding: EdgeInsets.only( top: 100 ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "Powerplay 2",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                    ],
                  ),
                  if( selectedIndex==3 || selectedIndex==0 ) GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1.3,
                    padding: const EdgeInsets.only( 
                      left: 20,
                      right: 20,
                      top: 20
                    ),
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                      Center ( child: Column ( children: [
                            Text( "PP2LW - #${widget.team.pp2lw[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp2lw[0]}",textAlign: TextAlign.center , )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Text( "PP2C - #${widget.team.pp2c[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp2c[0]}",textAlign: TextAlign.center , )
                          ]
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Text( "PP2RW - #${widget.team.pp2rw[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp2rw[0]}",textAlign: TextAlign.center , )
                          ] 
                        ), 
                      ),
                    ],
                  ),
                  if( selectedIndex==3 || selectedIndex==0 ) GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 3.5,
                    padding: const EdgeInsets.only( 
                      left: 20,
                      right: 20,
                      bottom: 20
                    ),
                    crossAxisSpacing: 0,
                    crossAxisCount: 2,
                    children: [
                      Center ( child: Column ( children: [
                            Text( "PP2LD - #${widget.team.pp2ld[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp2ld[0]}",textAlign: TextAlign.center , )
                          ] 
                        ), 
                      ),
                      Center ( child: Column ( children: [
                            Text( "PP2RD - #${widget.team.pp2rd[1]}", style: TextStyle( color: Colors.grey ) ),
                            Text( "${widget.team.pp2rd[0]}",textAlign: TextAlign.center , )
                          ]
                        ), 
                      ),
                    ],
                  ),
                  if( selectedIndex==4 || selectedIndex==0 ) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding( padding: EdgeInsets.only( top: 50 ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "Goalies",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                    ],                
                  ),
                  if( selectedIndex==4 || selectedIndex==0 ) GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 2,
                    padding: const EdgeInsets.only( left: 20, right: 20, top: 40 ),
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: [
                      Center ( child: Column( children: [ 
                            Container( child: Text( "G1 - #${widget.team.g1[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.g1[0]}",textAlign: TextAlign.center ) ), 
                          ]
                        )
                      ),
                      Center ( child: Column( children: [ 
                            Container( child: Text( "G2 - #${widget.team.g2[1]}", style: TextStyle( color: Colors.grey ) ) ),
                            Container( child: Text( "${widget.team.g2[0]}",textAlign: TextAlign.center ) ), 
                          ]
                        )
                      ),
                    ]
                  ),
                  if( selectedIndex==5 || selectedIndex==0 ) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding( padding: EdgeInsets.only( top: 50 ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                      Center ( child: Container( child: Text( "Out",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                      Expanded( child: Divider( color: Colors.grey ) ),
                    ],
                  ),
                  if( selectedIndex==5 || selectedIndex==0 ) GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 3.5,
                    padding: const EdgeInsets.all( 20 ),
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: [
                      for (var ir in widget.team.ir) Center( child: Text( "${ir}" ) )
                    ],
                  ),
                ]
              ),
          ),
          ),
        ),
      ]
    );
  }
}