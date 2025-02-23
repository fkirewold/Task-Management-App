part of 'task_bloc.dart';

sealed class TaskEvent {}

final class AddTask extends TaskEvent {
  final TaskModel task;

  AddTask({required this.task});
}

final class EditTask extends TaskEvent {
  final TaskModel task;

  EditTask({required this.task});
}

final class GetTasks extends TaskEvent {}
