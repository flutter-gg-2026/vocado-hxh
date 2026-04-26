import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_bottom_nav.dart';


class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCreatorCubit>();
    ValueNotifier<bool> isRecording = ValueNotifier<bool>(false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: BlocListener<TaskCreatorCubit, TaskCreatorState>(
            listener: (context, state) {
              if (state is TaskCreatedState) {
                context.push(Routes.taskReviw, extra: state.task);
              }
              if (state is TaskCreatorErrorState) {
                context.push(Routes.error);
              }
            },

            child: BlocBuilder<TaskCreatorCubit, TaskCreatorState>(
              builder: (context, state) {
                if (state is TaskRecordingState && state.text != null) {
                  print("TASK TEXT: ${state.text}");

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Task Created: ${state.text}")),
                    );
                  });
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Add A Voice Task\n",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "\nAdd your task to your team member\n"
                                  "by recording your voice,\n"
                                  "please make sure to mention a member\n"
                                  "name that you assigned this task for",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          print("START RECORDING");

                          isRecording.value = true;
                          await cubit.startVoiceMethod();
                        },
                        onLongPressUp: () async {
                          print("STOP RECORDING");

                          isRecording.value = false;
                          await cubit.stopVoiceMethod();
                        },
                        child: ValueListenableBuilder<bool>(
                          valueListenable: isRecording,
                          builder: (context, value, _) {
                            return Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: value
                                      ? [Colors.red, Colors.redAccent]
                                      : [
                                          Colors.purple.shade300,
                                          Colors.purple.shade700,
                                        ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple.withAlpha(77),
                                    blurRadius: 15,
                                    offset: Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: value
                                  ? Icon(
                                      Icons.mic,
                                      color: Colors.white,
                                      size: 40,
                                    )
                                  : Icon(
                                      Icons.mic,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
    );
  }
}
