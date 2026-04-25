import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/extensions/font_extensions.dart';
import 'package:vocado/core/utils/formatters.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.task, required this.color});
  final TaskEntity task;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isChecked = false;
    return Container(
      height: 20.sizeSW(min: 50, max: 200),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withAlpha(30),
            blurRadius: 3,
            spreadRadius: 0.5,
            offset: Offset(0, 3)
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          task.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleLarge,
          softWrap: true,
        ),
        subtitle: Row(
          children: [
            ImageIcon(
              AssetImage('assets/icons/image.png'),
              size: 5.sizeSW(min: 24, max: 48),
              color: color,
            ),
            Gap(5),
            Text(
              Formatters.formatTime(task.dueDate),
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
        trailing: Checkbox(value: isChecked, onChanged: (value) {}),
      ),
    );
  }
}
