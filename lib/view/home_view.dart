import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/constants/app_colors.dart';
import 'package:todoapp/constants/app_text_styles.dart';
import 'package:todoapp/logic/task_cubit.dart';
import 'package:todoapp/view/add_task_view.dart';
import 'package:todoapp/view/edit_task_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final tasks = state.tasks;

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      top: 19, left: 16, right: 74, bottom: 20),
                  color: AppColors.primary,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 25,
                      ),
                      const SizedBox(width: 21),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, Jhon',
                              style: AppTextStyles.white16,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'What are your plans for today?',
                              style: AppTextStyles.white25Italic,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, left: 24, right: 23, bottom: 32),
                  color: AppColors.secondary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 33.0),
                        child: Image.asset('assets/images/champion.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 33.0, left: 27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Go Pro (No Ads)',
                              style: AppTextStyles.dark18,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'No fuss, no ads, for only \$1 a month',
                              style: AppTextStyles.dark12,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 27),
                      Container(
                        color: AppColors.purple,
                        padding: const EdgeInsets.only(
                            top: 27, bottom: 26, right: 21, left: 23),
                        child: Text(
                          '\$1',
                          style: AppTextStyles.yellow12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.only(
                            left: 23, top: 27, bottom: 23, right: 19),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.4,
                                  child: Checkbox(
                                    value: task.isDone,
                                    onChanged: (bool? value) {
                                      context.read<TaskCubit>().toggleTask(index);
                                    },
                                    shape: const CircleBorder(),
                                    checkColor: AppColors.checked,
                                    fillColor: MaterialStateProperty.all(
                                      task.isDone
                                          ? AppColors.checkedBg
                                          : Colors.transparent,
                                    ),
                                  ),
                                ),
                                Text(
                                  task.name,
                                  style: TextStyle(
                                    color: task.isDone
                                        ? AppColors.strikeText
                                        : AppTextStyles.dark16.color,
                                    decoration: task.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return EditTaskView(
                                      taskIndex: index,
                                    );
                                  }),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(12),
                                ),
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        color: Colors.black, width: 1)),
                              ),
                              child: Text(
                                'Edit',
                                style: AppTextStyles.dark16,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 20),
                  child: FloatingActionButton(
                      backgroundColor: AppColors.primary,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const AddTaskView();
                          }),
                        );
                      },
                      child: const Icon(Icons.add)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
