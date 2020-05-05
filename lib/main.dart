import 'package:flutter/material.dart';
import 'package:planbreaker/widget/Bottombar.dart';
import 'package:planbreaker/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlanBreaker',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(child: Center(child: Text('달성기록'))),
              Container(child: Center(child: Text('편지'))),
              Container(child: Center(child: Text('설정')))
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
