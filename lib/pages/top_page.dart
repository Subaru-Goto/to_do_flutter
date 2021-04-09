import 'package:flutter/material.dart';
import 'package:simple_todo/model/task.dart';
import 'package:simple_todo/pages/add_task.dart';
import 'package:simple_todo/pages/done.dart';
import 'package:simple_todo/pages/stilltodo.dart';

class TopPage extends StatefulWidget {
  TopPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  // define variable
List<Task> stillTodoList = [
    Task(
        title: 'Test1',
        isDone: false,
        createdTime: DateTime.now()),
    Task(
        title: 'Test2',
        isDone: false,
        createdTime: DateTime.now()),
  ];

  List<Task> doneList = [];

  bool showStillToDoPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      // Stack widgets
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // if showStillToDoPage is true then show StillToDO else DonePage
          showStillToDoPage
              ? StillToDoPage(stillTodoList: stillTodoList, doneList: doneList)
              : DonePage(stillTodoList: stillTodoList, doneList: doneList),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    showStillToDoPage = true;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.redAccent,
                    child: Text('Still To Do',
                        style: TextStyle(color: Colors.white, fontSize: 50)),
                  ),
                ),
              ),
              Expanded(
                // InkWell + onTap enable widget to be tapped
                child: InkWell(
                  onTap: () {
                    showStillToDoPage = false;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.greenAccent,
                    child: Text('Done',
                        style: TextStyle(color: Colors.white, fontSize: 50)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        // async forces actions to wait
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTask(
                        stillTodoList: stillTodoList,
                      )));
          setState(() {});
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
