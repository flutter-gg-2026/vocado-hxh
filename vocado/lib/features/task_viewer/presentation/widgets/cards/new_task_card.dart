import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/extensions/font_extensions.dart';
import 'package:vocado/core/utils/formatters.dart';

class NewTaskCard extends StatelessWidget {
  const NewTaskCard({super.key, required this.task});
  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final taskStatus = ["In Progress", "Done", "Late"];
    String? currentValue;
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

          DropdownButton(
            hint: Text("Select Task Status"),
            value: currentValue,
            borderRadius: BorderRadius.circular(20),
            
            items: taskStatus
                .map((task) => DropdownMenuItem(value: task, child: Text(task)))
                .toList(),
            onChanged: (String? value) {
              currentValue = value;
            },
          ),
        ],
      ),
    );
  }
}
