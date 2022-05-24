import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:to_do_list/task_model.dart';


class AddTask extends StatefulWidget {
  const AddTask({required Key key, required this.addNewTask}) : super(key: key);
  final Function addNewTask;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> {
  late TextEditingController titleC;
  late TextEditingController descC;
  late DateTime d1;

  @override
  void initState() {
    titleC = TextEditingController();
    descC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleC.dispose();
    descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Title"),
              controller: titleC,
              keyboardType: TextInputType.text,
            ),
            Container(
              child: TextField(
                maxLines: 5,
                decoration: const InputDecoration(hintText: "Description"),
                controller: descC,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(DateTime.now().year,
                          DateTime.now().month, DateTime.now().day),
                      maxTime: DateTime(2024, 12, 29),
                      theme: DatePickerTheme(
                          headerColor: Colors.orange,
                          backgroundColor: Colors.blue,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onConfirm: (date) {
                    d1 = date;
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                child: Text(
                  'Pick a date',
                  style: TextStyle(color: Colors.white),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  String title = titleC.text;
                  String description = descC.text;
                  Task temp = Task(title, description, false, d1);
                  widget.addNewTask(temp);
                  titleC.clear();
                  descC.clear();
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
