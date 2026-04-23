import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';

class TaskCreatorFeatureScreen extends StatelessWidget {
  const TaskCreatorFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<TaskCreatorCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('TaskCreator Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
