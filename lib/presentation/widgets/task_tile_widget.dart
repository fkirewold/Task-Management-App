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

class TasktileWidget extends StatelessWidget {
  final TaskModel task;
  const TasktileWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    text: task.title.capitalizeFirstLetter(),
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  )),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ContainerWidget(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xffD4D4D4)),
                  child: Icon(
                    Icons.more_horiz,
                    color: Color(0xff252525),
                  ),
                ),
              ),
            ],
          ),
          TextWidget(
            text: task.description,
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
                text: DateFormat('dd MMM yyyy').format(task.startDate),
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
                text: DateFormat('dd MMM yyyy').format(task.endDate),
                fontSize: 12,
              ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    showTaskEditBottomSheet(context, task);
                  },
                  icon: Icon(Icons.edit)),
              SizedBox(
                width: 8,
              ),
              IconButton(
                onPressed: () {
                  context.read<TaskBloc>().add(DeleteTask(id: task.id));
                },
                icon: Icon(Icons.delete),
                padding: EdgeInsets.all(0),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
