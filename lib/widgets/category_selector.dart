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

  final List<String> lineCats = ['Forwards', 'Defense', 'Powerplay', 'Goalies', 'Injured'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) { 
    return Column(
      children: [ 
        Container(
          height: 60,
          color: getTeamColor("${widget.team.team}")[1],

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
                      color: index == selectedIndex ? getTeamColor("${widget.team.team}")[0] : Colors.white54,
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
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )
          ),
          child: ListView( 
            children: [
              Container( 
                padding: EdgeInsets.only( top:30 ),
                child: Column( 
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.network( "https://sportteamslogo.com/api?key=30fa25df759b495f8995bfb7dac527f9&size=medium&tid="+getTeamLogo("${widget.team.team}") ),
                    ),
                    Icon( Icons.update ),
                    Center( child: Text( 
                      "Updated at:",
                      style: TextStyle( fontSize: 16, color: Colors.grey )
                      ) 
                    ),
                    Center( child: Text( 
                        "${formatDate(widget.team.timestamp)}",
                        style: TextStyle( fontSize: 16, letterSpacing: 1.2 )
                      ) 
                    ) 
                  ]
                )
              ),
                if( selectedIndex==0 ) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding( padding: EdgeInsets.only( top: 100 ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "LW",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "C",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 )  ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "RW",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                  ],
                ),
                if( selectedIndex==0 ) GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 1.3,
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: [
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l1lw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l1lw[0]}",textAlign: TextAlign.center , ) )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l1c[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l1c[0]}",textAlign: TextAlign.center , ) ) 
                        ]
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l1rw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l1rw[0]}",textAlign: TextAlign.center , ) )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l2lw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l2lw[0]}",textAlign: TextAlign.center , ) )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l2c[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l2c[0]}",textAlign: TextAlign.center , ) ) 
                        ]
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l2rw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l2rw[0]}",textAlign: TextAlign.center , ) )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l3lw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l3lw[0]}",textAlign: TextAlign.center , ) )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l3c[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l3c[0]}",textAlign: TextAlign.center , ) ) 
                        ]
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l3rw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l3rw[0]}",textAlign: TextAlign.center , ) )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l4lw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l4lw[0]}",textAlign: TextAlign.center , ) )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l4c[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l4c[0]}",textAlign: TextAlign.center , ) ) 
                        ]
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Container( child: Text( "#${widget.team.l4rw[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.l4rw[0]}",textAlign: TextAlign.center , ) )
                        ] 
                      ), 
                    ),
                  ],
                ),
                if( selectedIndex==1 ) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding( padding: EdgeInsets.only( top: 100 ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "LD",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "RD",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 )  ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                  ],
                ),
                if( selectedIndex==1 ) GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 2,
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: [
                    Center ( child: Column( children: [ 
                          Container( child: Text( "#${widget.team.d1l[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.d1l[0]}",textAlign: TextAlign.center ) ), 
                        ]
                      )
                    ),
                    Center ( child: Column( children: [ 
                          Container( child: Text( "#${widget.team.d1r[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.d1r[0]}",textAlign: TextAlign.center ) ), 
                        ]
                      )
                    ),
                    Center ( child: Column( children: [ 
                          Container( child: Text( "#${widget.team.d2l[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.d2l[0]}",textAlign: TextAlign.center ) ), 
                        ]
                      )
                    ),
                    Center ( child: Column( children: [ 
                          Container( child: Text( "#${widget.team.d2r[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.d2r[0]}",textAlign: TextAlign.center ) ), 
                        ]
                      )
                    ),
                    Center ( child: Column( children: [ 
                          Container( child: Text( "#${widget.team.d3l[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.d3l[0]}",textAlign: TextAlign.center ) ), 
                        ]
                      )
                    ),
                    Center ( child: Column( children: [ 
                          Container( child: Text( "#${widget.team.d3r[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.d3r[0]}",textAlign: TextAlign.center ) ), 
                        ]
                      )
                    ),
                  ],
                ),
                if( selectedIndex==2 ) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding( padding: EdgeInsets.only( top: 100 ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "PP 1",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                  ],
                ),
                if( selectedIndex==2 ) GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 1.3,
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: [
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp1lw[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp1lw[0]}",textAlign: TextAlign.center , )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp1c[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp1c[0]}",textAlign: TextAlign.center , )
                        ]
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp1rw[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp1rw[0]}",textAlign: TextAlign.center , )
                        ] 
                      ), 
                    ),
                  ],
                ),
                if( selectedIndex==2 ) GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 3.5,
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  crossAxisSpacing: 0,
                  crossAxisCount: 2,
                  children: [
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp1ld[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp1ld[0]}",textAlign: TextAlign.center , )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp1rd[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp1rd[0]}",textAlign: TextAlign.center , )
                        ]
                      ), 
                    ),
                  ],
                ),
                if( selectedIndex==2 ) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding( padding: EdgeInsets.only( top: 100 ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "PP 2",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                  ],
                ),
                if( selectedIndex==2 ) GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 1.3,
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: [
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp2lw[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp2lw[0]}",textAlign: TextAlign.center , )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp2c[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp2c[0]}",textAlign: TextAlign.center , )
                        ]
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp2rw[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp2rw[0]}",textAlign: TextAlign.center , )
                        ] 
                      ), 
                    ),
                  ],
                ),
                if( selectedIndex==2 ) GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 3.5,
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  crossAxisSpacing: 0,
                  crossAxisCount: 2,
                  children: [
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp2ld[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp2ld[0]}",textAlign: TextAlign.center , )
                        ] 
                      ), 
                    ),
                    Center ( child: Column ( children: [
                          Text( "#${widget.team.pp2rd[1]}", style: TextStyle( color: Colors.grey ) ),
                          Text( "${widget.team.pp2rd[0]}",textAlign: TextAlign.center , )
                        ]
                      ), 
                    ),
                  ],
                ),
                if( selectedIndex==3 ) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding( padding: EdgeInsets.only( top: 100 ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "G",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                  ],                
                ),
                if( selectedIndex==3 ) GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 2,
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: [
                    Center ( child: Column( children: [ 
                          Container( child: Text( "#${widget.team.g1[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.g1[0]}",textAlign: TextAlign.center ) ), 
                        ]
                      )
                    ),
                    Center ( child: Column( children: [ 
                          Container( child: Text( "#${widget.team.g2[1]}", style: TextStyle( color: Colors.grey ) ) ),
                          Container( child: Text( "${widget.team.g2[0]}",textAlign: TextAlign.center ) ), 
                        ]
                      )
                    ),
                  ]
                ),
                if( selectedIndex==4 ) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding( padding: EdgeInsets.only( top: 100 ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                    Center ( child: Container( child: Text( "Out",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                    Expanded( child: Divider( color: Colors.grey ) ),
                  ],
                ),
                if( selectedIndex==4 ) GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 3.5,
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: [
                    for (var ir in widget.team.ir) Center( child: Text( "${ir}" ) )
                  ],
                ),
                Container( height: 100 )
              ]
            ),
          ),
        ),
      ]
    );
  }
}