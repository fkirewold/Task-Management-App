// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

class TaskState {
  final List<TaskModel> tasks;

  TaskState({required this.tasks});

  TaskState copyWith({
    List<TaskModel>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }
}
