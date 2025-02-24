import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/presentation/widgets/button_widget.dart';
import 'package:todo/presentation/widgets/container_widget.dart';
import 'package:todo/presentation/widgets/text_widget.dart';
import 'package:todo/presentation/widgets/textfield_widget.dart';

import '../../bloc/task/task_bloc.dart';

class EditShowBottomTaskSheet {}

showTaskEditBottomSheet(BuildContext context, TaskModel task) {
  final taskName = TextEditingController();
  final taskDescription = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  String priority = 'Medium';
  taskName.text = task.title;
  taskDescription.text = task.description;
  startDate=task.startDate;
  endDate=task.endDate;
  priority=task.priority;
  showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: TextWidget(
                          text: 'Edit Your Task',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextWidget(text: 'Task Name'),
                      TextfieldWidget(
                        hintText: 'Enter Task Name',
                        controller: taskName,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidget(text: 'Task Description'),
                      TextfieldWidget(
                          hintText: 'Add Description',
                          controller: taskDescription),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidget(text: 'Start and End Date'),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(3000),
                                );
                                if (date != null) {
                                  setState(() {
                                    startDate = date;
                                  });
                                }
                              },
                              child: ContainerWidget(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 45,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 215, 213, 213)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                        text: startDate != null
                                            ? DateFormat('dd MMM yyyy')
                                                .format(startDate!)
                                            : 'Start Date'),
                                    Icon(Icons.calendar_month_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(3000),
                                );
                                if (date != null) {
                                  setState(() {
                                    endDate = date;
                                  });
                                }
                              },
                              child: ContainerWidget(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 45,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 215, 213, 213)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                        text: endDate != null
                                            ? DateFormat('dd MMM yyyy')
                                                .format(endDate!)
                                            : 'End Date'),
                                    Icon(Icons.calendar_month_rounded),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      TextWidget(
                          text: 'Task Priority',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      DropdownButton(
                          value: priority,
                          isExpanded: true,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          items: [
                            DropdownMenuItem(
                              value: 'High',
                              child: TextWidget(text: 'High'),
                            ),
                            DropdownMenuItem(
                              value: 'Medium',
                              child: TextWidget(text: 'Medium'),
                            ),
                            DropdownMenuItem(
                              value: 'Low',
                              child: TextWidget(text: 'Low'),
                            )
                          ],
                          onChanged: (item) {
                            setState(() {
                              priority = item ?? 'Medium';
                            });
                          })
                    ],
                  ),
                ),
                ButtonWidget(
                  onPressed: () {
                    if (startDate != null && endDate != null) {
                     
                      final editedTask = TaskModel(
                        //for task edit use task.id
                        id: task.id,
                        title: taskName.text,
                        description: taskDescription.text,
                        startDate: startDate!,
                        endDate: endDate!,
                        isCompleted: false,
                        priority: priority,
                      );
                      context.read<TaskBloc>().add(EditTask(task: editedTask));
                      context.pop();
                    }
                  },
                  child: TextWidget(
                    text: 'Edit Task',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        });
      });
}
