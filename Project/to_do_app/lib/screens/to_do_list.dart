import 'package:flutter/material.dart';
import 'package:to_do_app/services/api_call.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List tasks = [];
  int selId = 0; //selected item id

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() {
    tasks = APICall.fetchTodos();
    setState(() {});
  }

  TextEditingController txtTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-Do App'),
        ),
        body: Column(
          children: [
            //add/update panel
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txtTitle,
                      decoration: InputDecoration(
                        hintText: 'Enter title',
                        labelText: 'Title',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //todo add/update task
                    if (txtTitle.text.isNotEmpty) {
                      if (selId == 0) {
                        tasks.add({
                          "id": DateTime.now().millisecondsSinceEpoch,
                          "title": txtTitle.text,
                          "isCompleted": false
                        });
                      } else {
                        int idx = tasks
                            .indexWhere((element) => element["id"] == selId);
                        if (idx > -1) {
                          var todo = tasks[idx];
                          todo['title'] = txtTitle.text;
                          tasks.removeAt(idx);
                          tasks.insert(idx, todo);
                          selId = selId + 1;
                        }
                      }

                      txtTitle.clear();
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            //display list panel
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (v) {
                        tasks[index]["isCompleted"] = v;
                        setState(() {});
                      },
                      value: tasks[index]["isCompleted"],
                      title: Text(
                        '${tasks[index]["title"]}',
                        style: TextStyle(
                            decoration: tasks[index]["isCompleted"]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: tasks[index]["isCompleted"]
                                ? Colors.red
                                : Colors.black),
                      ),
                      secondary: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                txtTitle.text = tasks[index]['title'];
                                selId = tasks[index]['id'];
                                setState(() {});
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                //to perform delete
                                tasks.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }
}
