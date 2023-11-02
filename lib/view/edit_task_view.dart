import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/constants/app_text_styles.dart';
import 'package:todoapp/constants/app_colors.dart';
import 'package:todoapp/logic/task_cubit.dart';
import 'package:todoapp/model/task_model.dart';

class EditTaskView extends StatelessWidget {
  final int taskIndex;

  const EditTaskView({Key? key, required this.taskIndex}) : super(key: key);
  void updateTaskName(BuildContext context, TextEditingController controller) {
    final String updatedTaskName = controller.text;
    if (updatedTaskName.isNotEmpty) {
      BlocProvider.of<TaskCubit>(context)
          .updateTaskName(taskIndex, updatedTaskName);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final Task task =
        BlocProvider.of<TaskCubit>(context).state.tasks[taskIndex];
    final TextEditingController taskNameController =
        TextEditingController(text: task.name);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Edit Task'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 39.0, left: 20, right: 20, bottom: 52),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Name',
                  style: AppTextStyles.black16,
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.grey),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: taskNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => updateTaskName(context, taskNameController),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(AppColors.primary),
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(16.0)),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
