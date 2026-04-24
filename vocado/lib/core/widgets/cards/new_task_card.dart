import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/extensions/font_extensions.dart';

class NewTaskCard extends StatelessWidget {
  const NewTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String? currentValue = "new";
    return Container(
      height: 45.sizeSW(min: 161, max: 280),
      width: 60.sizeSW(min: 244, max: 388),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withAlpha(130),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text("Task", style: theme.textTheme.titleLarge),
          Row(
            children: [
              ImageIcon(
                AssetImage('assets/icons/image.png'),
                size: 5.sizeSW(min: 24, max: 48),
                color: theme.colorScheme.tertiary,
              ),
              Gap(10),
              Text("date", style: theme.textTheme.bodyLarge),
            ],
          ),
          DropdownButton(
            value: currentValue,
            items: [DropdownMenuItem(value: "new", child: Text(currentValue))],
            onChanged: (String? value) {
              currentValue = value;
            },
          ),
        ],
      ),
    );
  }
}
