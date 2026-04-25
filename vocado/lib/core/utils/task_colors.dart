import 'dart:ui';
import 'package:vocado/core/constants/app_colors.dart';

class TaskColors {
  TaskColors._();

  static final taskColors = {
    'New': AppColors.secondary,
    'In Progress': AppColors.warning,
  };

  static Color getTaskColor(String status, DateTime duedate) {
    return duedate.isBefore(DateTime.now())
        ? AppColors.error
        : taskColors[status] ?? AppColors.error;
  }
}
