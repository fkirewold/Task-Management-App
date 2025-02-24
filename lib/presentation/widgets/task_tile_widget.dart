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
        Align(
            alignment: Alignment.topLeft,
            child: TextWidget(
              text: task.title,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            )),
        TextWidget(
          text: task.description,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Icon(
              Icons.work_history,
              color: Theme.of(context).primaryColor,
            ),
            TextWidget(text: DateFormat('dd MMM yyyy').format(task.startDate),fontSize: 12,),
            Icon(
              Icons.flag,
              color: Theme.of(context).primaryColor,
            ),
            TextWidget(text: DateFormat('dd MMM yyyy').format(task.endDate)),
            Spacer(),
            ButtonWidget(
                height: 35,
                width: 66,
                color: task.priority == 'Medium'
                    ? Color(0xffCC00FF)
                    : task.priority == 'Low'
                        ? Colors.amber
                        : null,
                onPressed: () {},
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: TextWidget(
                    text: task.priority,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ))
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
