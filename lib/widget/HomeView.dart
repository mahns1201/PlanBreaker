import 'package:flutter/material.dart';
import 'package:planbreaker/widget/HpWall.dart';

import 'package:planbreaker/data/MoveableData.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  {
  // bool get wantKeepAlive => true; with AutomaticKeepAliveClientMixin


  var _todoPackNameController = TextEditingController();

  void initState() {
    super.initState();
    print('HomeView initState');
  }

  void dispose() {
    print('HomeView dispose');
    _todoPackNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MoveableProvider moveableData = Provider.of<MoveableProvider>(context, );

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.add),
          onPressed: () {
              moveableData.showAlertDialog(context, _todoPackNameController);     
          },
        ),
        body: Container( //Expanded사용?
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/skybg.png"), fit: BoxFit.fill),
            ),
            child: Stack(
              children: <Widget>[
                Stack(
                   children: moveableData.movableItems
                  // children: moveableData.moveableMap['ㄴㄴ']
                ),
                HpWall(),
              ],
            )
      ));
  }
}