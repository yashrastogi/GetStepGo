import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardTab extends StatefulWidget {
  @override
  _LeaderboardTabState createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text('Leaderboard', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
