import 'package:flutter/material.dart';
import 'package:to_do_list/task_item.dart';
import 'package:to_do_list/task_model.dart';
import 'package:to_do_list/add_task.dart';

class ToDoList extends StatefulWidget {
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> taskList = [
  ];

  void changeIsdone(int index) {
    bool temp = taskList[index].isDone;
    setState(() {
      taskList[index].setIsDone(!temp);
    });
  }

  void addTask(Task temp) {
    setState(() {
      taskList.add(temp);
    });
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void sortTask() {
    setState(() {
      for (int i = 0; i < taskList.length; ++i) {
        for (int j = 0; j < taskList.length - i; ++j) {
          if (taskList[j].dataTime.isAfter(taskList[j + 1].dataTime)) {
            Task temp = taskList[j];
            taskList[j] = taskList[j + 1];
            taskList[j + 1] = temp;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return TaskItem(
                task: taskList[index],
                changeIsDone: () => changeIsdone(index),
                deleteTask: () => deleteTask(index),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return AddTask(
                  addNewTask: addTask,
                  key: new Key("value"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
