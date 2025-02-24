import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/settings.dart';
import 'package:todo/core/utils/show_bottom_task_shit.dart';
import 'package:todo/presentation/widgets/button_widget.dart';
import 'package:todo/presentation/widgets/container_widget.dart';
import 'package:todo/presentation/widgets/task_tile_widget.dart';
import 'package:todo/presentation/widgets/text_widget.dart';
import 'package:todo/presentation/widgets/textfield_widget.dart';

import '../../bloc/task/task_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String selectedFilter = 'all';

  @override
  void initState() {
    context.read<TaskBloc>().add(GetTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: 'Hello'),
            FutureBuilder(
                future: Settings.getUserName(),
                builder: (context, snapshot) {
                  return TextWidget(
                    text: snapshot.data ?? '****',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  );
                })
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ContainerWidget(
            height: 10,
            width: 10,
            color: Colors.yellow,
            shape: BoxShape.circle,
            child: FutureBuilder(
                future: Settings.getUserName(),
                builder: (context, snapshot) {
                  String firstNameLetter =
                      snapshot.data!.substring(0, 1).toUpperCase() ?? '**';
                  return Center(
                      child: TextWidget(
                    text: firstNameLetter,
                    fontSize: 26,
                  ));
                }),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ClipOval(
              child: ContainerWidget(
                height: 28,
                width: 28,
                border: Border.all(color: Color(0xffD4D4D4)),
                shape: BoxShape.circle,
                color: Colors.white,
                child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.menu, size: 20)),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextfieldWidget(
              hintText: 'find Your task here..',
              controller: controller,
              lebel: Icon(
                Icons.search,
                size: 25,
              ),
            ),
            TextWidget(
              text: 'Your Task',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 6,
                  children: [
                    ButtonWidget(
                        color: selectedFilter == 'all' ? null : Colors.white,
                        width: 115,
                        height: 40,
                        onPressed: () {
                          setState(() {
                            selectedFilter = 'all';
                          });
                        },
                        child: TextWidget(
                          text: 'all',
                          fontSize: 13,
                          color: selectedFilter == 'all' ? Colors.white : null,
                        )),
                    ButtonWidget(
                        color:
                            selectedFilter == 'pending' ? null : Colors.white,
                        width: 115,
                        height: 40,
                        onPressed: () {
                          setState(() {
                            selectedFilter = 'pending';
                          });
                        },
                        child: TextWidget(
                            text: 'Pending',
                            fontSize: 13,
                            color: selectedFilter == 'pending'
                                ? Colors.white
                                : null)),
                    ButtonWidget(
                        color:
                            selectedFilter == 'completed' ? null : Colors.white,
                        width: 115,
                        height: 40,
                        onPressed: () {
                          setState(() {
                            selectedFilter = 'completed';
                          });
                        },
                        child: TextWidget(
                          text: 'Completed',
                          fontSize: 13,
                          color: selectedFilter == 'completed'
                              ? Colors.white
                              : null,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        for (var task in state.tasks)
                          TasktileWidget(
                            task: task,
                          )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTaskBottomSheet(context);
        },
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
