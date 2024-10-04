import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/todo.dart'; // Importing the ToDo model
import '../constants/colors.dart'; // Importing color constants
import '../controller/todo_item.dart'; // Importing the ToDoItem widget

// The main Home widget, a StatefulWidget to manage state
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// State class for Home
class _HomeState extends State<Home> {
  // List to hold all the ToDo items
  final todosList =
      ToDo.todoList(); // Initializing the list with predefined items
  List<ToDo> _foundToDo = []; // List to hold filtered ToDo items
  final _todoController =
      TextEditingController(); // Controller for the TextField

  @override
  void initState() {
    _foundToDo = todosList; // Initialize _foundToDo with all todos
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor, // Setting background color
      appBar: _buildAppBar(), // Building the app bar
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(), // Search box for filtering todos
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'All ToDos', // Title for the ToDo list
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // Displaying each ToDo item in reverse order
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo, // Passing the current ToDo item
                          onToDoChanged:
                              _handleToDoChange, // Callback for when ToDo is changed
                          onDeleteItem:
                              _deleteToDoItem, // Callback for deleting a ToDo item
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Bottom input field and button for adding new ToDo items
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for input field
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, // Shadow effect
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: TextField(
                    controller: _todoController, // TextField controller
                    decoration: const InputDecoration(
                        hintText: 'Add a new todo item', // Placeholder text
                        border: InputBorder.none), // No border
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _addToDoItem(_todoController.text); // Adding new ToDo item
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue, // Button background color
                    minimumSize: const Size(60, 60), // Button size
                    elevation: 10, // Button shadow
                  ),
                  child: const Text(
                    '+', // Button text
                    style: TextStyle(
                        fontSize: 40, color: Colors.white), // Text style
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Handle change of ToDo item status (completed or not)
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone; // Toggle the isDone status
    });
  }

  // Delete ToDo item from the list by its ID
  void _deleteToDoItem(String id) {
    setState(() {
      todosList
          .removeWhere((item) => item.id == id); // Remove item from the list
    });
  }

  // Add new ToDo item to the list
  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(), // Unique ID based on timestamp
        todoText: toDo, // ToDo text
      ));
    });
    _todoController.clear(); // Clear the text field after adding
  }

  // Filter ToDo items based on search input
  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList; // If search input is empty, show all todos
    } else {
      results = todosList
          .where((item) => item.todoText!.toLowerCase().contains(
              enteredKeyword.toLowerCase())) // Filter based on search input
          .toList();
    }

    setState(() {
      _foundToDo = results; // Update found ToDo list
    });
  }

  // Widget for the search box
  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white, // White background for the search box
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value), // Run filter on text change
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0), // Padding for the input
          prefixIcon: Icon(
            Icons.search, // Search icon
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none, // No border for the input field
          hintText: 'Search', // Placeholder text
          hintStyle: TextStyle(color: tdGrey), // Hint text style
        ),
      ),
    );
  }

  // Widget to build the app bar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor, // App bar background color
      elevation: 0, // No shadow
      title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu, // Menu icon
              color: tdBlack,
              size: 30,
            ),
          ]),
    );
  }
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent)); // Setting the status bar color
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'ToDo App', // Application title
      home: Home(), // Home widget as the main screen
    );
  }
}
