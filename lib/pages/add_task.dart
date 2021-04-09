import 'package:flutter/material.dart';
import 'package:simple_todo/model/task.dart';

class AddTask extends StatefulWidget {
  final List<Task> stillTodoList;
  AddTask({this.stillTodoList});

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please add your task'),
      ),
      // Column widget will place widget vertically
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20.0),
              child: Text('Title'),
            ),
            Container(
                width: 500,
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 200,
                child: ElevatedButton(onPressed: () {
                  // Task Class
                  Task newTask = Task(
                    title: titleController.text,
                    isDone:false,
                    createdTime: DateTime.now()
                  );
                  widget.stillTodoList.add(newTask);
                  // Go back to the original screen
                  Navigator.pop(context);
                },
                    child: Text('Add')),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
