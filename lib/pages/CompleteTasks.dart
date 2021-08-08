import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_managment_gsg/providers/provider.dart';
import 'package:state_managment_gsg/widgets/task_widget.dart';

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<provider>(context).completetasks == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: Provider.of<provider>(context).completetasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                Provider.of<provider>(context).completetasks[index],
              );
            });
  }
}
