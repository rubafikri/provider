import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_gsg/models/task.dart';
import 'package:state_managment_gsg/providers/provider.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: task.isComplete ? Colors.greenAccent : Colors.redAccent,
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: IconButton(
              onPressed: () {
                Provider.of<provider>(context, listen: false).removeTask(task);
              },
              icon: Icon(Icons.delete)),
          trailing: Checkbox(
              value: task.isComplete,
              onChanged: (v) {
                Provider.of<provider>(context, listen: false).updateTask(task);
              }),
          title: Text(task.taskName),
        ));
  }
}
