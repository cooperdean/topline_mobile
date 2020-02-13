import 'package:flutter/material.dart';
import 'lines_tab.dart';

class TeamRoster extends StatelessWidget {

  final TeamLine team;
  TeamRoster( {Key key, @required this.team }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "${team.team}" )
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Colors.green, Icons.star, "${team.l1lw}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.l1c}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.l1rw}" ),
              ]
              )
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Colors.green, Icons.star, "${team.l2lw}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.l2c}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.l2rw}" ),
              ]
              )
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Colors.green, Icons.star, "${team.l3lw}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.l3c}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.l3rw}" ),
              ]
              )
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Colors.green, Icons.star, "${team.l4lw}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.l4c}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.l4rw}" ),
              ]
              )
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Colors.green, Icons.star, "${team.d1l}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.d1r}" ),
              ]
              )
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Colors.green, Icons.star, "${team.d2l}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.d2r}" ),
              ]
              )
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Colors.green, Icons.star, "${team.d3l}" ),
                _buildButtonColumn(Colors.green, Icons.star, "${team.d3r}" ),
              ]
              )
            ),
          
        ],
      )
    );
  }



  Column _buildButtonColumn( Color color, IconData icon, String label ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

}

