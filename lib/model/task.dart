class Task {
  String title;
  bool isDone;
  DateTime createdTime;
  DateTime updatedTime;

  // Constructor -- initialize objects
  Task({
    // Initialization code goes here.
    this.title,
    this.isDone,
    this.createdTime,
    this.updatedTime,
  });
}

/*
This is similar to this in python
class Task(object):
    def __init__(self, t, d, ct, ut):
        self.title = t
        self.isDone = d
        self.createdTime = ct
        self.updatedTime = ut
  */
