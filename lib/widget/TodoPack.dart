import 'package:flutter/material.dart';
import 'package:planbreaker/widget/Todolist.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> movableItems = []; //List를  Home Screen에서 저장할 수 있게 만들자.
  var count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          //foregroundColor: Colors.amberAccent,
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              //할 일 보따리 제목 입력하는 기능 추가.
              count++;
              //movableItems.add(MoveableStackItem(blockName: ,));
              movableItems.add(MoveableStackItem(count: count)); //add할 때 Todolist list도 같이 갱신되게 만들자.
            });
          },
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/skybg.png"), fit: BoxFit.cover),
            ),
            child: Stack(
              children: movableItems,
            )));
  }
}

class MoveableStackItem extends StatefulWidget {
  //final String blockName;
  final int count;
  const MoveableStackItem ({Key key, this.count}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    return _MoveableStackItemState();
  }
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  String blockName = "";
  var localCount = 0; 
  double xPosition = 0;
  double yPosition = 0;

  @override
  void initState() {
    localCount = widget.count;
    blockName = '$localCount';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
        onTap: () {   //터치하면 투두리스트로 화면이동.
        //print("Container clicked");
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Navitest() ));
        },
        onPanUpdate: (tapInfo) { //TodoPack 이동기능.
          setState(() {
            xPosition += tapInfo.delta.dx;
            yPosition += tapInfo.delta.dy;
          });
        },
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/block/crystal.png"), fit: BoxFit.cover),
          ),
          //child: Center(child: Text($blockName)),
          child: Center(child: Text('$blockName')),
        ),
      ),
    );
  }
}
