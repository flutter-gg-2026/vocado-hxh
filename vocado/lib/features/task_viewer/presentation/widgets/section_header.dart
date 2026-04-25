import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.taskStatus,
    required this.taskTotal,
    this.onPressed,
    this.backgroundColor,
  });
  final String taskStatus;
  final String taskTotal;
  final Color? backgroundColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            Text(taskStatus, style: theme.textTheme.titleLarge),
            Gap(5),
            CircleAvatar(
              radius: 15,
              backgroundColor: backgroundColor,
              child: Text(taskTotal, style: theme.textTheme.titleLarge),
            ),
          ],
        ),

        TextButton(
          onPressed: onPressed,
          child: Text("View All", style: theme.textTheme.bodyLarge),
        ),
      ],
    );
  }
}
