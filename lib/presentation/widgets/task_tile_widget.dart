import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/bloc/task/task_bloc.dart';
import 'package:todo/core/utils/edit_show_bottom_task_sheet.dart';
import 'package:todo/helper/string_extension.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/presentation/widgets/button_widget.dart';
import 'package:todo/presentation/widgets/container_widget.dart';
import 'package:todo/presentation/widgets/text_widget.dart';

class TasktileWidget extends StatefulWidget {
  final TaskModel task;
  final String filter;
  const TasktileWidget({super.key, required this.task, required this.filter});

  @override
  State<TasktileWidget> createState() => _TasktileWidgetState();
}

class _TasktileWidgetState extends State<TasktileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final updateTask = widget.task.copyWith(
          isCompleted: !widget.task.isCompleted,
        );
        context.read<TaskBloc>().add(EditTask(task: updateTask));
        context.read<TaskBloc>().add(TaskFilter(filter: widget.filter));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ContainerWidget(
          padding: EdgeInsets.all(10),
          // height: 180,
          border: Border.all(color: Color(0xffD4D4D4)),
          borderRadius: BorderRadius.circular(15),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Wrap(children: [
            Row(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: TextWidget(
                      text: widget.task.title.capitalizeFirstLetter(),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
                Spacer(),
                Checkbox(
                    value: widget.task.isCompleted,
                    onChanged: (value) {
                      final updateTask = widget.task.copyWith(
                        isCompleted: value,
                      );
                      context.read<TaskBloc>().add(EditTask(task: updateTask));
                    })
              ],
            ),
            TextWidget(
              text: widget.task.description,
              fontWeight: FontWeight.normal,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.work_history,
                  color: Theme.of(context).primaryColor,
                ),
                TextWidget(
                  text: DateFormat('dd MMM yyyy').format(widget.task.startDate),
                  fontSize: 12,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.flag,
                  color: Theme.of(context).primaryColor,
                ),
                TextWidget(
                  text: DateFormat('dd MMM yyyy').format(widget.task.endDate),
                  fontSize: 12,
                ),
                Spacer(),
                ButtonWidget(
                    height: 35,
                    width: 80,
                    color: widget.task.priority == 'Medium'
                        ? Color(0xffCC00FF)
                        : widget.task.priority == 'Low'
                            ? Colors.amber
                            : null,
                    onPressed: () {},
                    child: TextWidget(
                      text: widget.task.priority,
                      fontSize: 14,
                      color: Colors.white,
                    ))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      showTaskEditBottomSheet(context, widget.task);
                    },
                    icon: Icon(Icons.edit)),
                SizedBox(
                  width: 8,
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<TaskBloc>()
                        .add(DeleteTask(id: widget.task.id));
                  },
                  icon: Icon(Icons.delete),
                  padding: EdgeInsets.all(0),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
