import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_button.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_outline_box.dart';

class TaskReviewScreen extends StatelessWidget {
  const TaskReviewScreen({super.key, required this.task});
  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final _ = context.read<TaskCreatorCubit>();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Task Reviw",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.teal, size: 26),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(60),
            Text(
              "Task is:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Gap(6),
            Text(
              task.title,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Gap(30),
            CustomOutlineBox(
              text: task.assignee?.isEmpty ?? true
                  ? "Not assigned"
                  : task.assignee!,
            ),
            Gap(16),
            CustomOutlineBox(
              text: DateFormat('yyyy-MM-dd').format(task.dueDate),
            ),
            Gap(30),
            CustomButtonPuple(text: "Approved"),
          ],
        ),
      ),
    );
  }
}
