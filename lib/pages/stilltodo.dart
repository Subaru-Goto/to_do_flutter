import 'package:flutter/material.dart';
import 'package:simple_todo/model/task.dart';

class StillToDoPage extends StatefulWidget {
  final List<Task> stillTodoList;
  final List<Task> doneList;

  StillToDoPage({this.stillTodoList, this.doneList});

  @override
  _StillToDoPageState createState() => _StillToDoPageState();
}

class _StillToDoPageState extends State<StillToDoPage> {
  // Able to edit text
  TextEditingController editTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return // ListView.builder generates List of items
        ListView.builder(
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
            widget.stillTodoList[index].title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // Value when it is clicked
          value: widget.stillTodoList[index].isDone,
          // Action when it is clicked
          onChanged: (bool value) {
            // Change the param to 1 or 0
            widget.stillTodoList[index].isDone = value;
            // add done task to done list
            widget.doneList.add(widget.stillTodoList[index]);
            // Remove isDone task from stilltodo task
            widget.stillTodoList.removeAt(index);
            // Set state --> change state
            setState(() {});
          },
          // second check box
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
                              //edit action
                              // show bottom sheet
                              Navigator.pop(context);
                              // show edit screen
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      titlePadding: EdgeInsets.all(20),
                                      title: Container(
                                          width: 500,
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Text('Edit title'),
                                              Container(
                                                width: 500,
                                                child: TextField(
                                                  controller:
                                                      editTitleController,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Container(
                                                  width: 500,
                                                  height: 20,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        widget.stillTodoList[index]
                                                                .title =
                                                            editTitleController
                                                                .text;
                                                        widget.stillTodoList[index]
                                                                .updatedTime =
                                                            DateTime.now();
                                                        // Back to original screen
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: Text('Edit')),
                                                ),
                                              ),
                                            ],
                                          )),
                                    );
                                  });
                            }),
                        ListTile(
                          title: Text('Delete'),
                          leading: Icon(Icons.delete),
                          onTap: () {
                            //Shoe bottom sheet
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                        'Would you like to delete "${widget.stillTodoList[index].title}" ?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            widget.stillTodoList
                                                .removeAt(index);
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
      itemCount: widget.stillTodoList.length,
    );
  }
}
