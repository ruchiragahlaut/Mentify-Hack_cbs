import 'package:flutter/material.dart';
import 'package:navigation_test/widgets/icon_badge.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:navigation_test/utils/todo_objects.dart';
import 'package:navigation_test/screens/addtodoitem.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  static TodoList todoList = new TodoList();
  bool _isTextFieldVisible = true;

  void _removeItem(int index) {
    setState(() {
      todoList.todolist.removeAt(index);
    });
  }

  void _addItem(String task, String category) {
    setState(() {
      todoList.addItem(task, category);
    });
  }

  @override
  void initState() {
    todoList.addItem("Exercise 30 minutes", "Lifestyle");
    todoList.addItem("Meditation 15 minutes", "Lifestyle");
    todoList.addItem("8 glasses of water", "Health");
    todoList.addItem("Full meal", "Health");
    todoList.addItem("Focussed two hours", "Work");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckList"),
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
      body: ListView.builder(
        itemCount: todoList.todolist.length,
        itemBuilder: (context, index) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: Text((index + 1).toString()),
                  foregroundColor: Colors.white,
                ),
                title: Text(todoList.todolist[index].getTaskLabel()),
                subtitle: Text(todoList.todolist[index].getCategoryLabel()),
              ),
            ),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Mark completed',
                color: Colors.green,
                icon: Icons.check,
                onTap: () => _removeItem(index),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTodoItem(),
              ));
          if (result != null) {
            _addItem(result[0], result[1]);
            print("I am here");
            print(result[0]);
            print(result[1]);
          } else {
            print("user had not entered anything");
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
