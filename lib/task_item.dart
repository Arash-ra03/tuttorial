import 'package:flutter/material.dart';
import 'package:to_do_list/detail_task.dart';
import 'package:to_do_list/task_model.dart';


class TaskItem extends StatefulWidget {
  TaskItem(
      {required this.task,
      required this.changeIsDone,
      required this.deleteTask});

  final Task task;
  final Function changeIsDone;
  final Function deleteTask;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        widget.deleteTask();
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert !!"),
      content: Text("Would you like to delete \"" + widget.task.title + "\" ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        tileColor: widget.task.isDone ? Colors.grey : Colors.white,
        title: Text(
          widget.task.title,
        ),
        textColor: widget.task.isDone ? Colors.white : Colors.black,
        subtitle: Text(widget.task.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailTask(
                    key: new Key("value"),
                    task: widget.task,
                    changeIsDone: widget.changeIsDone)),
          ).then((value) => setState(() {}));
        },
        trailing: Container(
          width: 50,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.changeIsDone();
                },
                child: widget.task.isDone
                    ? const Icon(
                        Icons.check_box,
                        color: Colors.green,
                      )
                    : Icon(Icons.check_box_outline_blank),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  showAlertDialog(context);
                  //deleteTask();
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
