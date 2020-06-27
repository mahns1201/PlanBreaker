import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:planbreaker/data/TodoListData.dart';
import 'package:planbreaker/data/MoveableData.dart';

class TodoListView extends StatelessWidget {
  final int todoListViewcount;
  final String todoName;
  const TodoListView({Key key, this.todoListViewcount, this.todoName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green,
          accentColor: Colors.white),
      home: TodoList(count: todoListViewcount, todoName: todoName),
    );
  }
}

class TodoList extends StatefulWidget {
  final int count;
  final String todoName;
  TodoList({Key key, this.count, this.todoName}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var _todoController = TextEditingController();

  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TodoListProvider todoData = Provider.of<TodoListProvider>(context, );
    final MoveableProvider moveableData = Provider.of<MoveableProvider>(context, );

    return Builder(
      builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text(widget.todoName??'default value',
        style: TextStyle(
              fontFamily: 'Dot',
              fontSize: 20
              ),
        ),
        leading: new Icon(Icons.assignment),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_sweep),
            tooltip: 'Delete',
            onPressed: () {
              int cycleCount = 0;
              print('Widget TodoName : ' + widget.todoName);
              while(true) {
                if (widget.todoName == moveableData.moveableNames[cycleCount]) {
                  moveableData.removeIndex = cycleCount;
                  moveableData.todoListRemove();
                  print('moveableName : ' + moveableData.moveableNames[cycleCount]);
                  Navigator.pop(context);
                  moveableData.moveableNames.removeAt(cycleCount);
                  moveableData.movableItems.removeAt(cycleCount);
                  break;
                }
                cycleCount++;
              } 
              moveableData.decrementInputCounter();
              // moveableData.decrementNameCounter();
              print('afterDelete');
              print(moveableData.inputCounter);
              print(moveableData.moveableNames);
              print(moveableData.movableItems.length);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
             child: Container(
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('images/block/cloud.png'),
                   fit: BoxFit.contain,

                 )
               ),
             child: ListView(
              children: todoData.todoItems.map<Widget>((todo) => todoData.buildItemWidget(todo)).toList()
            ),
             ),
        ),

        Row(
          children: <Widget>[
            Expanded(
                child: TextField(
                style: TextStyle(fontFamily: 'Dot',
                fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
                controller: _todoController,  
             ),
            ),

            RaisedButton(
              child: Text('추가',
              style: TextStyle(fontFamily: 'Dot',
              fontSize: 15),
              ),
              onPressed: () {
                todoData.addTodo(TodoListTile(_todoController.text));
                _todoController.text = "";
              },
            )
          ],
        ),
        ],
      ),
      ),
    );
  }
}