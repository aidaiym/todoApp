import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/constants/app_colors.dart';
import 'package:todoapp/constants/app_text_styles.dart';
import 'package:todoapp/logic/task_cubit.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({Key? key}) : super(key: key);

  void addTask(BuildContext context, TextEditingController controller) {
    final taskName = controller.text;
    if (taskName.isNotEmpty) {
      context.read<TaskCubit>().addTask(taskName);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Add New Task'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => addTask(context, taskNameController),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(AppColors.primary),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
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
