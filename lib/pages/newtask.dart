import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_gsg/models/task.dart';
import 'package:state_managment_gsg/providers/provider.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  bool isComplete = false;

  String taskName;

  saveTask() {
    Provider.of<provider>(context, listen: false)
        .insertTask(Task(taskName: taskName, isComplete: isComplete));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Insert New Task'),
            TextField(
                onChanged: (v) {
                  this.taskName = v;
                },
                decoration: InputDecoration(
                    labelText: 'Task Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)))),
            Checkbox(
                value: isComplete,
                onChanged: (v) {
                  this.isComplete = v;
                  setState(() {});
                }),
            RaisedButton(
                child: Text('Insert New Task'),
                onPressed: () {
                  saveTask();
                })
          ],
        ),
      ),
    );
  }
}
