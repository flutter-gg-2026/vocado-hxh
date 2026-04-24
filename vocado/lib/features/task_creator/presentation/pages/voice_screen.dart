import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_bottom_nav.dart';
import 'package:lottie/lottie.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<TaskCreatorCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
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
                            "\nAdd your task to your team member\nby recording your voice,\n"
                            "please make sure to mention a member\nname that you assigned this task for",
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
                  onLongPress: () {},
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
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
                    child: Icon(Icons.mic, color: Colors.white, size: 40),

                    // Lottie.asset(
                    //   "assets/animations/search_mic_wave.json",
                    //  repeat: false
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 0),
    );
  }
}
