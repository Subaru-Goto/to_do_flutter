

import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  TopPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "A widget is either stateful or stateless."
                  " If a widget can change—when a user interacts with it,"
                  " for example—it's stateful. A stateless widget never changes."
                  " Icon , IconButton , and Text are examples of stateless widgets.",
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}