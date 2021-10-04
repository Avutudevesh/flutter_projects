class Task {
  final String title;
  bool isDone = false;

  Task({this.title});

  void changeTaskState(bool value) {
    this.isDone = value;
  }
}
