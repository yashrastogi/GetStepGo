import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tabs/summary/summary.dart';
import 'tabs/leaderboard/leaderboard.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

String appTitle = 'GetStepGo';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return CupertinoApp(
      title: appTitle,
      theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(),
          brightness: Brightness.dark,
          primaryColor: CupertinoTheme.of(context).primaryColor),
      home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: HomePage(title: '$appTitle Home Page'),
          title: Text('GetStepGo',
              style: TextStyle(fontFamily: 'Pacifico', fontSize: 60, color: Colors.black)),
          // image: Image.network('https://i.imgur.com/TyCSG9A.png'),
          backgroundColor: Colors.white,
          photoSize: 100.0,
          loaderColor: Colors.black),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          backgroundColor: Color.fromRGBO(44, 44, 45, 0.8),
          activeColor: Color.fromRGBO(150, 250, 50, 1.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_2_circlepath_circle),
              activeIcon: Icon(CupertinoIcons.arrow_2_circlepath_circle_fill),
              label: 'Summary',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar_circle),
              activeIcon: Icon(CupertinoIcons.chart_bar_circle_fill),
              label: 'Leaderboard',
            )
          ]),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SummaryTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: LeaderboardTab(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
