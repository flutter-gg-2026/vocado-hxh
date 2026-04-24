import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<TaskCreatorCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Opps!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Gap(12),
              Text(
                "Looks like the recored isn’t working.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Gap(30),
              CustomButtonPuple(text: "Try again"),
            ],
          ),
        ),
      ),
    );
  }
}
