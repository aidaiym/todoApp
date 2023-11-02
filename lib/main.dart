import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/logic/task_cubit.dart';

import 'package:todoapp/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: const MaterialApp(
        title: 'To Do App',
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
