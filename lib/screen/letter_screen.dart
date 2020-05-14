import 'package:flutter/material.dart';

void ma() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Lettere(),
      '/s': (context) => Letters(),
    },
  ));
}


//------------------------------------------------


class Lettere extends StatefulWidget { 
    @override 
    State createState() => LettereState(); 
}

class ScreenArguments {
  final String title;
  final String message;
  final int time;

  ScreenArguments(this.title, this.message, this.time);
}



class LettereState extends State<Lettere> { 
  final TextEditingController _textController = new TextEditingController();

  DateTime selectedDate = DateTime.now();

    Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 4),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
     appBar: AppBar( 
      title: Text("Letter"), 
      ), 
    body: _buildTextComposer(),
          
    ); } 



  Widget _buildTextComposer() { 
    return Container( 
      margin: const EdgeInsets.symmetric(horizontal: 8.0), 
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            Text("${selectedDate.toLocal()}"),
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
          
          Flexible(
            child: TextField( 
              controller: _textController, 
              onSubmitted: _handleSubmitted, 
              decoration: new InputDecoration.collapsed( 
                hintText: "Letter"),
         ), 
         ),
         
         Container(
           margin: const EdgeInsets.symmetric(horizontal:4.0),
           child: IconButton(
             icon: Icon(Icons.send),
             onPressed: () => _handleSubmitted(_textController.text)),
         ),
        ],
      )
    );
} 
void _handleSubmitted(String text) { 
_textController.clear(); } 



  Widget move(){
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Open Letters'),
          onPressed: () {
            Navigator.pushNamed(context, '/s');
          },
        ),
      ),
    );

  }
}
//------------------------------------------------

// DB 관련 부분 들어가야함~!~!


//------------------------------------------------
void mai() {
  runApp(MaterialApp(
      home: Scaffold(body:Letters())));
}

class Letters extends StatefulWidget {
  @override
  _LettersState createState() => _LettersState();
}

class _LettersState extends State<Letters> {

  final items = List.generate(10, (i) => "리스트 ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(items[index]),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
             child: ListTile(title: Text(items[index])),
              background: Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text(
                    "삭제",
                    style: TextStyle(fontSize: 50),
                  )
                  ),
            );
          },
        ); 
  }
  }