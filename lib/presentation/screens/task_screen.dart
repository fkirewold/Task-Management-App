import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/router.dart';
import 'package:todo/core/settings.dart';
import 'package:todo/core/utils/show_bottom_task_shit.dart';
import 'package:todo/presentation/widgets/button_widget.dart';
import 'package:todo/presentation/widgets/container_widget.dart';
import 'package:todo/presentation/widgets/task_tile_widget.dart';
import 'package:todo/presentation/widgets/text_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../bloc/task/task_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String selectedFilter = 'all';
  late TextEditingController controller;

  @override
  void initState() {
    context.read<TaskBloc>().add(GetTasks());

    controller = TextEditingController();
    // Listen to text changes and update the state
    controller.addListener(() {
      setState(() {}); // Rebuild the widget when text changes
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
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
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/profileicon.png'), // Load image from assets
              fit: BoxFit.cover, // Ensure the image covers the container
            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Search tasks...', // Placeholder text
                  prefixIcon: Icon(Icons.search), // Search icon
                  suffixIcon: controller.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            controller.clear(); // Clear the text
                            context.read<TaskBloc>().add(SearchTask(query: ''));
                          },
                        )
                      : null, // Clear button when text is entered
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ), // Rounded corners
                  filled: true, // Fill the background
                  fillColor: Colors.grey[200], // Light grey background
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16), // Padding inside the field
                ),
                onTapOutside: (d) {
                  FocusScope.of(context).unfocus();
                },

                keyboardType: TextInputType.text,
                // Keyboard type for text input
                onChanged: (value) {
                  // Handle real-time search functionality
                  context.read<TaskBloc>().add(SearchTask(query: value));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextWidget(
                text: 'Your Task',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
                          context
                              .read<TaskBloc>()
                              .add(TaskFilter(filter: selectedFilter));
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
                          context
                              .read<TaskBloc>()
                              .add(TaskFilter(filter: selectedFilter));
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
                          context
                              .read<TaskBloc>()
                              .add(TaskFilter(filter: selectedFilter));
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
                            filter: selectedFilter,
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
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            gap: 7,
            padding: EdgeInsets.all(10),
            color: Colors.white,
            activeColor: Colors.pink,
            tabBackgroundColor: const Color.fromARGB(255, 239, 232, 232),
            tabs: [
              GButton(
                iconColor: Colors.blue,
                icon: Icons.home,
                text: 'Home',
                iconSize: 30,
                onPressed: () {},
              ),
              GButton(
                onPressed: () {},
                leading: SizedBox(
                  child: Image.asset(
                    width: 40,
                    height: 30,
                    'assets/images/taskicon.png',
                    fit: BoxFit.contain,
                  ),
                ),
                icon: Icons.favorite,
                text: 'Tasks',
              ),
              GButton(
                onPressed: () {
                  context.goNamed(RouteName.blog);
                },
                leading: SizedBox(
                  child: Image.asset(
                    width: 40,
                    height: 30,
                    'assets/images/blogicon.png',
                    fit: BoxFit.contain,
                  ),
                ),
                icon: Icons.find_in_page,
                text: 'Blog',
              )
            ],
          ),
        ),
      ),
    );
  }
}
