import 'package:flutter/material.dart';

import '../model/todo.dart'; // Importing the ToDo model.
import '../constants/colors.dart'; // Importing custom color constants.

class ToDoItem extends StatelessWidget {
  final ToDo todo; // The ToDo item to be displayed.
  // Callback function when the ToDo item is changed (completed or not).
  // ignore: prefer_typing_uninitialized_variables
  final onToDoChanged;
  // Callback function when the delete icon is pressed.
  // ignore: prefer_typing_uninitialized_variables
  final onDeleteItem;

  const ToDoItem({
    super.key,
    required this.todo, // Required parameter for the ToDo item.
    required this.onToDoChanged, // Required callback for item change.
    required this.onDeleteItem, // Required callback for item deletion.
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20), // Space between items.
      child: ListTile(
        onTap: () {
          // This triggers when the ToDo item is tapped.
          // print('Clicked on Todo Item.'); // Uncomment for debugging.
          onToDoChanged(todo); // Call the callback to update ToDo status.
        },
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), // Rounded corners for the tile.
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // Padding inside the tile.
        tileColor: Colors.white, // Background color of the tile.
        leading: Icon(
          // Icon showing whether the ToDo is completed or not.
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue, // Color for the checkbox icon.
        ),
        title: Text(
          todo.todoText!, // Display the text of the ToDo item.
          style: TextStyle(
            fontSize: 16, // Font size for the ToDo text.
            color: tdBlack, // Text color.
            decoration: todo.isDone
                ? TextDecoration.lineThrough
                : null, // Strikethrough if done.
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(
              0), // No padding inside the trailing container.
          margin: const EdgeInsets.symmetric(
              vertical: 12), // Vertical margin for the container.
          height: 35, // Fixed height for the delete button.
          width: 35, // Fixed width for the delete button.
          decoration: BoxDecoration(
            color: tdRed, // Background color for the delete button.
            borderRadius: BorderRadius.circular(
                5), // Rounded corners for the delete button.
          ),
          child: IconButton(
            color: Colors.white, // Icon color.
            iconSize: 18, // Size of the delete icon.
            icon: const Icon(Icons.delete), // Delete icon.
            onPressed: () {
              // This triggers when the delete icon is pressed.
              // print('Clicked on delete icon'); // Uncomment for debugging.
              onDeleteItem(
                  todo.id); // Call the callback to delete the ToDo item.
            },
          ),
        ),
      ),
    );
  }
}
