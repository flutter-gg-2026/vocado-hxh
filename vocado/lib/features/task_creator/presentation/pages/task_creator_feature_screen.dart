import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_bottom_nav.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_tab.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_task_card.dart';

class TaskCreatorFeatureScreen extends StatelessWidget {
  const TaskCreatorFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Tasks board",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.notifications_none, color: Colors.teal),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  CustomTab(
                    text: 'in progress',
                    color: Colors.orange,
                    isActive: true,
                  ),
                  Gap(20),
                  CustomTab(text: 'Done', color: Colors.teal, isActive: false),
                  Gap(20),
                  CustomTab(text: 'late', color: Colors.red, isActive: false),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Tasks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.tune, color: Colors.teal),
                  ),
                ],
              ),
            ),
            const Gap(15),
            Expanded(
              child: BlocBuilder<TaskCreatorCubit, TaskCreatorState>(
                builder: (context, state) {
                     print("STATE: $state");
                  if (state is TaskRecordingLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is TaskCreatorErrorState) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  if (state is TaskCreatorSuccessState) {
                    final tasks = state.tasks;

                    if (tasks.isEmpty) {
                      return const Center(child: Text("No tasks yet"));
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<TaskCreatorCubit>().getAllTasks();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: CustomTaskCard(
                              title: task.title,
                              name: task.assignee ?? "Unknown",
                              status: task.status,
                              date:
                                  "${task.dueDate.hour}:${task.dueDate.minute}",
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }
}
