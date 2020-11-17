import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:getstepgo/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummaryTab extends StatefulWidget {
  @override
  _SummaryTabState createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          backgroundColor: Colors.black,
          leading: DateText(),
          largeTitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Summary', style: TextStyle(color: Colors.white))]),
        ),
        SliverSafeArea(
            sliver: SliverList(
                delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActivityStatusCard(),
                SizedBox(height: 20),
                WorkoutsAggregator(),
              ],
            ),
          ),
        ]))),
      ],
    );
  }
}

class WorkoutsAggregator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Workouts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Show More', style: TextStyle(color: Color.fromRGBO(167, 251, 50, 1.0)))
        ],
      ),
      SizedBox(height: 10),
      WorkoutCard(workoutName: 'Outdoor Walk', distance: 8.0),
      SizedBox(height: 10),
      WorkoutCard(workoutName: 'Indoor Walk', distance: 1.2),
      SizedBox(height: 10),
      WorkoutCard(workoutName: 'Outdoor Run', distance: 10.3),
    ]);
  }
}

class WorkoutCard extends StatelessWidget {
  final String workoutName;
  final double distance;

  const WorkoutCard({Key key, @required this.workoutName, @required this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBaseCard(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      children: [
        Expanded(
            flex: 2,
            child: Image(image: NetworkImage('https://i.imgur.com/yICIxTu.png'), height: 50)),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workoutName, style: TextStyle(fontSize: 18),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$distance',
                      style: TextStyle(
                          color: Color.fromRGBO(177, 250, 50, 1.0),
                          // fontWeight: FontWeight.bold,
                          fontSize: 29),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text('KM',
                          style: TextStyle(
                              color: Color.fromRGBO(177, 250, 50, 1.0),
                              // fontWeight: FontWeight.bold,
                              fontSize: 22)),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text('Monday >',
                                  style: TextStyle(
                                      fontSize: 13, color: Color.fromRGBO(140, 140, 140, 1.0)))),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomBaseCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;
  const CustomBaseCard(
      {Key key,
      @required this.children,
      this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromRGBO(28, 30, 30, 1.0),
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 20, color: Colors.white),
          child: Padding(
            padding: padding,
            child: Row(
              children: children,
            ),
          ),
        ));
  }
}

class ActivityStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Activity', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      CustomBaseCard(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Move'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '600/600',
                    style: TextStyle(
                        color: Color.fromRGBO(253, 26, 63, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Text('KCAL',
                        style: TextStyle(
                            color: Color.fromRGBO(253, 26, 63, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  )
                ],
              ),
              Text('Exercise'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '30/30',
                    style: TextStyle(
                        color: Color.fromRGBO(177, 250, 50, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Text('MIN',
                        style: TextStyle(
                            color: Color.fromRGBO(177, 250, 50, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  )
                ],
              ),
              Text('Stand'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '12/12',
                    style: TextStyle(
                        color: Color.fromRGBO(45, 254, 244, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Text('HRS',
                        style: TextStyle(
                            color: Color.fromRGBO(45, 254, 244, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(child: Image(image: NetworkImage('https://i.imgur.com/ZkT8ttP.png')))
      ]),
    ]);
  }
}

class DateText extends StatelessWidget {
  const DateText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "${Utility.getDayName(DateTime.now().weekday)}, ${DateTime.now().day} ${Utility.getMonthName(DateTime.now().month).substring(0, 3)}"
              .toUpperCase(),
          style: TextStyle(
              color: Color.fromRGBO(111, 111, 111, 1.0), fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
