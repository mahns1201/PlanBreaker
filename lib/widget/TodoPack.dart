import 'package:flutter/material.dart';

// class TodoPack extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     print("add container");  
//     return Container(
//       width: 20,
//       height: 20,
//       color: Colors.amberAccent
//     );
//   }
// }

class TodoPack extends StatefulWidget {
  @override
  _TodoPackState createState() => _TodoPackState();
}

class _TodoPackState extends State<TodoPack> {
  @override
  Widget build(BuildContext context) {
    print('hihi');
     return Container(
      width: 20,
      height: 20,
      color: Colors.amberAccent,
     );
  } 
}