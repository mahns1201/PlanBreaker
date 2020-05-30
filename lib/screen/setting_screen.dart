import 'package:flutter/material.dart';
//import 'package:planbreaker/screen/login_main.dart'; 메소드만 호출하는 법?

class Setting extends StatefulWidget {
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  bool toggleValue = false;

  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("환경설정"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // 로그아웃(?)
            },
          )
        ],
      ),  
      body: Center(
        child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 40.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: toggleValue
              ? Colors.greenAccent[100]
              : Colors.redAccent[100].withOpacity(0.5)
              ),
      child: Stack(children: <Widget>[
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          top: 3.0,
          left: toggleValue ? 60.0 : 0.0,
          right: toggleValue ? 0.0 : 60.0,
          child: InkWell(
            onTap: toggleButton,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(child: child, turns: animation);
              },
              child: toggleValue
                  ? Icon(Icons.check_circle,
                      color: Colors.green, size: 35.0, key: UniqueKey())
                  : Icon(Icons.remove_circle_outline,
                      color: Colors.red, size: 35.0, key: UniqueKey()),
            ),
          ),
        )
      ]),
     ),
   ));
  }
}
