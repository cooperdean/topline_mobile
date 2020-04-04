class TeamLine {

  final String team;
  final List ir;
  final String timestamp;
  final List l1lw;
  final List l1c;
  final List l1rw;
  final List l2lw;
  final List l2c;
  final List l2rw;
  final List l3lw;
  final List l3c;
  final List l3rw;
  final List l4lw;
  final List l4c;
  final List l4rw;
  final List d1r;
  final List d1l;
  final List d2r;
  final List d2l;
  final List d3r;
  final List d3l;
  final List pp1lw;
  final List pp1c;
  final List pp1rw;
  final List pp1ld; 
  final List pp1rd; 
  final List pp2lw;
  final List pp2c;
  final List pp2rw;
  final List pp2ld;
  final List pp2rd;
  final List g1;
  final List g2;
  final String record;
  
  TeamLine( 

    this.team,
    this.ir,
    this.timestamp,
    this.l1lw,
    this.l1c,
    this.l1rw,
    this.l2lw,
    this.l2c,
    this.l2rw,
    this.l3lw,
    this.l3c,
    this.l3rw,
    this.l4lw,
    this.l4c,
    this.l4rw,
    this.d1r,
    this.d1l,
    this.d2r,
    this.d2l,
    this.d3r,
    this.d3l,
    this.pp1lw,
    this.pp1c,
    this.pp1rw,
    this.pp1ld,
    this.pp1rd,
    this.pp2lw,
    this.pp2c,
    this.pp2rw,
    this.pp2ld,
    this.pp2rd,
    this.g1,
    this.g2,
    this.record

   );

}

class TeamSchedule {

  final String gameNumber;
  final String date;
  final String homeAway;
  final String opponent;
  final String goalsFor;
  final String goalsAgainst;
  final String result;
  final String overtime;

  TeamSchedule(
    this.gameNumber,
    this.date,
    this.homeAway,
    this.opponent,
    this.goalsFor,
    this.goalsAgainst,
    this.result,
    this.overtime
  );

}