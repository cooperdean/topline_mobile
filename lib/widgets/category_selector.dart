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

  final List<String> lineCats = ['Forwards', 'Defense', 'Powerplay 1', 'Powerplay 2', 'Injured'];
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
                            fontFamily: 'Chivo',
                            color: index == selectedIndex ? getTeamColor("${widget.team.team}")[0] : Colors.white60,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.4
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
                            Icon( Icons.update ),
                            Center( child: Text( "${formatDate(widget.team.timestamp)}" ) ) 
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
                        childAspectRatio: 2,
                        padding: const EdgeInsets.symmetric( horizontal: 20 ),
                        crossAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: [
                          Center ( child: Container( child: Text( "${widget.team.l1lw}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l1c}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l1rw}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l2lw}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l2c}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l2rw}",textAlign: TextAlign.center, ) ), ),          
                          Center ( child: Container( child: Text( "${widget.team.l3lw}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l3c}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l3rw}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l4lw}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l4c}",textAlign: TextAlign.center, ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.l4rw}",textAlign: TextAlign.center, ) ), ),        
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
                        childAspectRatio: 3.5,
                        padding: const EdgeInsets.symmetric( horizontal: 20 ),
                        crossAxisSpacing: 5,
                        crossAxisCount: 2,
                        children: [
                          Center ( child: Container( child: Text( "${widget.team.d1l}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.d1r}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.d2l}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.d2r}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.d3l}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.d3r}",textAlign: TextAlign.center ) ), ),
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
                        childAspectRatio: 6,
                        padding: const EdgeInsets.symmetric( horizontal: 0 ),
                        crossAxisSpacing: 5,
                        crossAxisCount: 1,
                        children: [
                          Center ( child: Container( child: Text( "${widget.team.pp1lw}   ${widget.team.pp1c}   ${widget.team.pp1rw}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.pp1ld}   ${widget.team.pp1rd}",textAlign: TextAlign.center ) ), ),
                        ],
                      ),
                      if( selectedIndex==3 ) Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding( padding: EdgeInsets.only( top: 100 ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "PP 2",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                        ],
                      ),
                      if( selectedIndex==3 ) GridView.count(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 6,
                        padding: const EdgeInsets.symmetric( horizontal: 0 ),
                        crossAxisSpacing: 5,
                        crossAxisCount: 1,
                        children: [
                          Center ( child: Container( child: Text( "${widget.team.pp2lw}   ${widget.team.pp2c}   ${widget.team.pp2rw}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${widget.team.pp2ld}   ${widget.team.pp2rd}",textAlign: TextAlign.center ) ), ),
                        ],
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