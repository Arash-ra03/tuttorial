import 'package:flutter/material.dart';
import 'package:to_do_list/task_model.dart';


class DetailTask extends StatefulWidget {
  const DetailTask(
      {required Key key, required this.task, required this.changeIsDone});

  final Task task;
  final Function changeIsDone;

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              enabled: false,
              decoration: InputDecoration(
                  hintText: widget.task.title,
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2.0))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              enabled: false,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: widget.task.description,
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2.0))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              enabled: false,
              decoration: InputDecoration(
                  hintText: "Expires on:  "+widget.task.dataTime.toString(),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2.0))),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Container(
                  child: Text(
                    "Done:",
                    style: TextStyle(
                      color: widget.task.isDone ? Colors.teal : Colors.black12,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Switch(
                  value: widget.task.isDone,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      bool temp = widget.task.isDone;
                      widget.task.setIsDone(!temp);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
