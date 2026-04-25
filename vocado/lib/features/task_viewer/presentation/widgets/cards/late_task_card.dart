import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/extensions/font_extensions.dart';
import 'package:vocado/core/utils/formatters.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';

class LateTaskCard extends StatelessWidget {
  const LateTaskCard({super.key, required this.task});
  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<TaskViewerCubit>();
    bool isChecked = false;
    return Container(
      width: 45.sizeSW(min: 161, max: 280),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .start,
        children: [
          Text(
            "Late",
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.error.withAlpha(100),
            ),
          ),
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
                color: theme.colorScheme.error,
              ),
              Gap(5),

              Text(
                Formatters.formatDate(task.dueDate),
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
 Checkbox(
          value: isChecked,
          onChanged: (value) {
            if (value == true) {
              isChecked=value!;
              cubit.updateTaskMethod(id: task.id, newStatus: "Done");
            }
          },
        ),        ],
      ),
    );
  }
}
