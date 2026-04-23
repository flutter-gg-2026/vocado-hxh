import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';

class TaskViewerFeatureScreen extends StatelessWidget {
  const TaskViewerFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<TaskViewerCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('TaskViewer Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
