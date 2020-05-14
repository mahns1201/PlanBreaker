import 'package:flutter/material.dart';
import 'package:planbreaker/widget/Bottombar.dart';
import 'package:planbreaker/screen/home_screen.dart';
import 'package:planbreaker/screen/letter_screen.dart';
import 'package:planbreaker/screen/setting_screen.dart';

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
              Lettere(),
              MyAp(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//     Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PlanBreaker',
//       theme: ThemeData(
//           brightness: Brightness.dark,
//           primaryColor: Colors.black,
//           accentColor: Colors.white),
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           body: TabBarView(
//             physics: NeverScrollableScrollPhysics(),
//             children: <Widget>[
//               HomeScreen(),
//               Container(child: Center(child: Text('달성기록'))),
//               Lettere(),
//               MyAp(),
//             ],
//           ),
//           bottomNavigationBar: Bottom(),
//         ),
//       ),
//     );
//   }
// }
