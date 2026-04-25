import 'package:flutter/material.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/utils/task_colors.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/cards/list_card.dart';

class TaskBoard extends StatelessWidget {
  const TaskBoard({super.key, required this.tasks});
  final List<TaskEntity> tasks;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskViewerCubit>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text.rich(
          TextSpan(
            text: "Hello,",
            style: theme.textTheme.bodyLarge,

            children: <TextSpan>[
              TextSpan(
                text: "Ohood",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<TaskViewerCubit,TaskViewerState>(
            builder: (context, state) {
              return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) => ListCard(
                task: tasks[index],
                color: TaskColors.getTaskColor(tasks[index].status),
               ) );
            },
          ),
          ),
        ),
    
    );
  }
}
