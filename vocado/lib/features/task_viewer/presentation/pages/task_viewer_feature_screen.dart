import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/constants/app_colors.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/cards/in_progress_task_card.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/cards/late_task_card.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/cards/new_task_card.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/section_header.dart';

class TaskViewerFeatureScreen extends StatelessWidget {
  const TaskViewerFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskViewerCubit>();
    final theme = Theme.of(context);
    cubit.getTaskViewerMethod();
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<TaskViewerCubit, TaskViewerState>(
                  builder: (context, state) {
                    if (state is TaskViewerSuccessState) {
                      return Column(
                        children: [
                          SectionHeader(
                            taskStatus: "New",
                            taskTotal: state.newTasks.length.toString(),
                            backgroundColor: theme.colorScheme.secondary.withAlpha(
                              200,
                            ),
                            onPressed: () {},
                          ),

                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 25.sh),
                            child: ListView.builder(
                              scrollDirection: .horizontal,
                              itemCount: state.newTasks.length,
                              itemBuilder: (context, index) =>
                                  NewTaskCard(task: state.allTasks[index]),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is TaskViewerErrorState) {
                      return Center(child: Text("Error ${state.message}"));
                    }
                    return Center(child: Text("Error"));
                  },
                ),
                Gap(15),
                BlocBuilder<TaskViewerCubit, TaskViewerState>(
                  builder: (context, state) {
                    if (state is TaskViewerSuccessState) {
                      return Column(
                        children: [
                          SectionHeader(
                            taskStatus: "Late",
                            taskTotal: state.lateTasks.length.toString(),
                            backgroundColor: theme.colorScheme.error.withAlpha(
                              150,
                            ),
                            onPressed: () {},
                          ),

                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 28.sh),
                            child: ListView.builder(
                              scrollDirection: .horizontal,
                              itemCount: state.lateTasks.length,
                              itemBuilder: (context, index) =>
                                  LateTaskCard(task: state.allTasks[index]),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is TaskViewerErrorState) {
                      return Center(child: Text("Error ${state.message}"));
                    }
                    return Center(child: Text("Error"));
                  },
                ),
                Gap(15),
                BlocBuilder<TaskViewerCubit, TaskViewerState>(
                  builder: (context, state) {
                    if (state is TaskViewerSuccessState) {
                      return Column(
                        children: [
                          SectionHeader(
                            taskStatus: "In Progress",
                            taskTotal: state.inProgressTasks.length.toString(),
                            backgroundColor: AppColors.warning.withAlpha(150),
                            onPressed: () {},
                          ),

                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 30.sh),
                            child: ListView.builder(
                              itemCount: state.inProgressTasks.length,
                              itemBuilder: (context, index) =>
                                  InProgressTaskCard(
                                    task: state.allTasks[index],
                                  ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is TaskViewerErrorState) {
                      return Center(child: Text("Error ${state.message}"));
                    }
                    return Center(child: Text("Error"));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
