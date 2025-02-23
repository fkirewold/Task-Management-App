import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/presentation/widgets/button_widget.dart';
import 'package:todo/presentation/widgets/container_widget.dart';
import 'package:todo/presentation/widgets/text_widget.dart';

class TasktileWidget extends StatelessWidget {
  final TaskModel task;
  const TasktileWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 180,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 209, 206, 206),
      child: Column(children: [
        TextWidget(text: task.title),
        TextWidget(text: task.description),
        Row(
          children: [
            Icon(
              Icons.work_history,
              color: Theme.of(context).primaryColor,
            ),
            TextWidget(text: DateFormat('dd MMM yyyy').format(task.startDate)),
            Icon(
              Icons.flag,
              color: Theme.of(context).primaryColor,
            ),
            TextWidget(text: DateFormat('dd MMM yyyy').format(task.endDate)),
            Spacer(),
            ButtonWidget(
                color: task.priority == 'Medium'
                    ? Color(0xffCC00FF)
                    : task.priority == 'Low'
                        ? Colors.amber
                        : null,
                onPressed: () {},
                child: TextWidget(text: task.priority))
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            SizedBox(
              width: 8,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit))
          ],
        )
      ]),
    );
  }
}
