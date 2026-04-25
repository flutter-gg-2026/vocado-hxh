import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/extensions/font_extensions.dart';
import 'package:vocado/core/utils/formatters.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class NewTaskCard extends StatelessWidget {
  const NewTaskCard({super.key, required this.task});
  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskViewerCubit>();
    final theme = Theme.of(context);
    final taskStatus = ["In Progress", "Done"];
    return Container(
      height: 45.sizeSW(min: 161, max: 280),
      width: 60.sizeSW(min: 244, max: 388),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withAlpha(130),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .start,
        children: [
          Text(
            task.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleLarge,
            softWrap: true,
          ),
          Row(
            children: [
              ImageIcon(
                AssetImage('assets/icons/image.png'),
                size: 5.sizeSW(min: 24, max: 48),
                color: theme.colorScheme.tertiary,
              ),
              Gap(5),
              Text(
                Formatters.formatDate(task.dueDate),
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),

          BlocBuilder<TaskViewerCubit, TaskViewerState>(
            builder: (context, state) {
              return DropdownButton(
                hint: Text("Select Task Status"),
                borderRadius: BorderRadius.circular(20),

                items: taskStatus
                    .map(
                      (status) =>
                          DropdownMenuItem(value: status, child: Text(status)),
                    )
                    .toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    cubit.updateTaskMethod(id: task.id, newStatus: value);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
