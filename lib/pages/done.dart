import 'package:flutter/material.dart';
import 'package:simple_todo/model/task.dart';

class DonePage extends StatefulWidget {
  final List<Task> stillTodoList;
  final List<Task> doneList;

  DonePage({this.stillTodoList, this.doneList});

  @override
  _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  TextEditingController editTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ItemBuilder function takes BuildContext and int param
      // ItemBuilder is a scrollable widget
      // Index --> 0....n,
      itemBuilder: (BuildContext context, int index) {
        // CheckboxListTile generates checkbox
        return CheckboxListTile(
          // leading --> Left
          controlAffinity: ListTileControlAffinity.leading,
          // Title of checkbox
          title: Text(
            widget.doneList[index].title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // Value when it is clicked
          value: widget.doneList[index].isDone,
          // Action when it is clicked
          onChanged: (bool value) {
            // Change the param to 1 or 0
            widget.doneList[index].isDone = value;
            // add done task to done list
            widget.stillTodoList.add(widget.doneList[index]);
            // Remove isDone task
            widget.doneList.removeAt(index);
            // Set state --> change state
            setState(() {});
          },
          secondary: IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Edit'),
                          leading: Icon(Icons.edit),
                          onTap: () {
                            // Hide bottom sheet
                            Navigator.pop(context);
                            // Show edit dialog
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                      titlePadding: EdgeInsets.all(20),
                                      title: Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Text('Title Edit'),
                                              Container(
                                                width: 500,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder()),
                                                  controller:
                                                      editTitleController,
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    widget.doneList[index]
                                                            .title =
                                                        editTitleController
                                                            .text;
                                                    widget.doneList[index]
                                                            .updatedTime =
                                                        DateTime.now();
                                                  },
                                                  child: Text('Edit'))
                                            ],
                                          )));
                                });
                          },
                        ),
                        ListTile(
                          title: Text('Delete'),
                          leading: Icon(Icons.delete),
                          onTap: () {
                            // delete action
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                        'Would you like to delete "${widget.doneList[index].title}" ?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            widget.doneList.removeAt(index);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text('Yes')),
                                      TextButton(
                                          onPressed: () {
                                            // Cancell so back to the previous screen
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'))
                                    ],
                                  );
                                });
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        );
      },
      // Property of ListViewBuilder
      // ListViewBuilder asks how many times should I build?
      itemCount: widget.doneList.length,
    );
  }
}
