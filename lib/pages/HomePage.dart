import 'package:flutter/material.dart';
import 'package:state_managment_gsg/pages/AllTasks.dart';

import 'CompleteTasks.dart';
import 'InCompleteTasks.dart';
import 'newtask.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NewTaskPage();
                      }));
                    },
                    icon: Icon(Icons.add))
              ],
              title: Text('My Task'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'All Tasks',
                  ),
                  Tab(
                    text: 'complete Tasks',
                  ),
                  Tab(
                    text: 'incomplete  Tasks',
                  )
                ],
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: [AllTasks(), CompleteTasks(), InCompleteTasks()],
            )));
  }
}
