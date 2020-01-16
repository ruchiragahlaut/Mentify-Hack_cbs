import 'package:flutter/material.dart';
import 'package:navigation_test/widgets/icon_badge.dart';

class AddTodoItem extends StatefulWidget {
  @override
  _AddTodoItemState createState() => _AddTodoItemState();
}

class _AddTodoItemState extends State<AddTodoItem> {
  TextEditingController messageCtrlTask = new TextEditingController();
  TextEditingController messageCtrlCategory = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add a TODO"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: IconBadge(
                icon: Icons.notifications_none,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Write down the task',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      //                   <--- left side
                      color: Colors.lightBlueAccent,
                      width: 3.0,
                    ),
                    bottom: BorderSide(
                      //                    <--- top side
                      color: Colors.lightBlueAccent,
                      width: 3.0,
                    ),
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: messageCtrlTask,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '45 min gym session',
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      //                   <--- left side
                      color: Colors.lightBlueAccent,
                      width: 3.0,
                    ),
                    bottom: BorderSide(
                      //                    <--- top side
                      color: Colors.lightBlueAccent,
                      width: 3.0,
                    ),
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: messageCtrlCategory,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Sports',
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, [
                    messageCtrlTask.toString(),
                    messageCtrlCategory.toString()
                  ]);
                },
                child: Text(
                  "Back to checklist",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                color: Colors.blue,
                colorBrightness: Brightness.dark,
                disabledColor: Colors.blueGrey,
                highlightColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
