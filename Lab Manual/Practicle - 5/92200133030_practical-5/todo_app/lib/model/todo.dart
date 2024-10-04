class ToDo {
  // Unique identifier for the ToDo item
  String? id;

  // The text description of the ToDo item
  String? todoText;

  // Flag to indicate whether the ToDo item is completed or not
  bool isDone;

  // Constructor for the ToDo class, with 'id' and 'todoText' being required
  // 'isDone' is optional and defaults to false
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  // Static method to return an empty list of ToDo items
  static List<ToDo> todoList() {
    return []; // Returns an empty list of ToDo objects
  }
}
