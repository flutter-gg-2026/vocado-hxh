import 'dart:ui';
import 'package:vocado/core/constants/app_colors.dart';

class TaskColors {
  TaskColors._();

 static final taskColors = {
    'New': AppColors.secondary,
    'Late': AppColors.error,
    'In Progress': AppColors.warning,
  };

  static Color getTaskColor(String status) {
    return taskColors[status] ?? AppColors.disabled;
  }
}
