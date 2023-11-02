import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/model/task_model.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState([]));

  void addTask(String taskName) {
    final List<Task> updatedTasks = List.from(state.tasks);
    updatedTasks.add(Task(taskName, false));
    emit(TaskState(updatedTasks));
  }

  void toggleTask(int index) {
    final List<Task> updatedTasks = List.from(state.tasks);
    updatedTasks[index].isDone = !updatedTasks[index].isDone;
    emit(TaskState(updatedTasks));
  }

  void updateTaskName(int taskIndex, String updatedTaskName) {
    final List<Task> updatedTasks = List.from(state.tasks);
    updatedTasks[taskIndex].name = updatedTaskName;
    emit(TaskState(updatedTasks));
  }
}
