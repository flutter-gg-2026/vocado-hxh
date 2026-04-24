import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/widgets/cards/new_task_card.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskViewerFeatureScreen extends StatelessWidget {
  const TaskViewerFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskViewerCubit>();
    final theme = Theme.of(context);
    cubit.getTaskViewerMethod();
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          textAlign: .center,

          TextSpan(
            text: "Hello,",
            style: theme.textTheme.titleLarge,

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<TaskViewerCubit, TaskViewerState>(
              builder: (context, state) {
                if (state is TaskViewerSuccessState) {
                  return Column(children: [NewTaskCard()]);
                }
                if (state is TaskViewerErrorState) {
                  context.showSnackBar(state.message, isError: true);

                  return Center(
                    child: Text("errorjjxndcxnedncoeddncnednedned"),
                  );
                }
                return Center(child: Text("errorjjxndcxnedncoeddncnednedned"));
              },
            ),
          ),
        ),
      ),
    );
  }
}
