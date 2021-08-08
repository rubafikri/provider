import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_gsg/providers/my_provider.dart';
import 'package:state_managment_gsg/providers/provider.dart';
import 'package:state_managment_gsg/widgets/task_widget.dart';

import '../database/dbHelper.dart';
import '../models/task.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider.of<provider>(context).alltasks == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: Provider.of<provider>(context).alltasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(Provider.of<provider>(context).alltasks[index]);
            });
  }
}
