import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          seconds: 10,
          navigateAfterSeconds: HomePage(title: '$appTitle Home Page'),
          title: Text('Welcome In SplashScreen'),
          image: Image.network('https://i.imgur.com/TyCSG9A.png'),
          backgroundColor: CupertinoTheme.of(context).primaryColor,
          photoSize: 100.0,
          loaderColor: Colors.red),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(activeColor: Colors.lime, items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bolt_circle),
          activeIcon: Icon(CupertinoIcons.bolt_circle_fill),
          label: 'Summary',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.list_number),
          activeIcon: Icon(CupertinoIcons.list_number),
          label: 'Leaderboard',
        )
      ]),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SizedBox(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SizedBox(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
