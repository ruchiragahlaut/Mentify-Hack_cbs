class TodoList {
  var todolist = new List();

  TodoList();

  void addItem(String task, String category) {
    todolist.add(TodoItem(task, category));
  }

  void removeItem() {}
}

class TodoItem {
  String _taskLabel;
  bool _completed;
  String _category;

  TodoItem(this._taskLabel, this._category) {
    this._completed = false;
  }
  String getTaskLabel() {
    return _taskLabel;
  }

  String getCategoryLabel() {
    return _category;
  }
}
