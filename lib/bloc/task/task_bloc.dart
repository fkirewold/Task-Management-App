import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/settings.dart';
import 'package:todo/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc()
      : super(TaskState(
          tasks: [],
        )) {
    on<AddTask>(_onAddTask);
    on<EditTask>(_onEditTask);
    on<DeleteTask>(_onDeleteTask);
    on<GetTasks>(_onGetTasks);
    on<TaskFilter>(_onTaskFilter);
    on<SearchTask>(_onSearchTask);
  }
  _onEditTask(EditTask event, Emitter emit) async {
    final tasks =
        state.tasks.map((t) => t.id == event.task.id ? event.task : t).toList();
    await Settings.editTask(event.task);
    emit(state.copyWith(
      tasks: tasks,
    ));
  }

  _onTaskFilter(TaskFilter event, Emitter emit) async {
    final tasks = await Settings.getTasks();
    if (event.filter == 'all') {
      emit(state.copyWith(
        tasks: tasks,
      ));
    } else if (event.filter == 'pending') {
      emit(state.copyWith(
          tasks: tasks.where((t) => t.isCompleted == false).toList()));
    } else {
      emit(state.copyWith(tasks: tasks.where((t) => t.isCompleted).toList()));
    }
  }

  _onAddTask(AddTask event, Emitter emit) async {
    List<TaskModel> tasks = state.tasks;
    tasks.add(event.task);
    await Settings.setTask(event.task);
    emit(
      state.copyWith(
        tasks: tasks,
      ),
    );
  }

  _onDeleteTask(DeleteTask event, Emitter emit) async {
    final tasks = state.tasks;
    tasks.removeWhere((t) => t.id == event.id);
    await Settings.deleteTask(event.id);
    emit(state.copyWith(tasks: tasks));
  }

  _onGetTasks(GetTasks event, Emitter emit) async {
    final tasks = await Settings.getTasks();
    emit(state.copyWith(
      tasks: tasks,
    ));
  }
  _onSearchTask(SearchTask event, Emitter emit) async{
    if( event.query.isEmpty)
    {
    final tasks = await Settings.getTasks();
      
     emit(
      state.copyWith(
      tasks: tasks,
     ));
    }
    final tasks =
        state.tasks.where((t) => t.title.toLowerCase().contains(event.query.toLowerCase())).toList();
    emit(state.copyWith(
      tasks: tasks,
    ));
  }
}
