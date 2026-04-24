import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.obscureText = false,
    this.validator,
    required this.hintText,
  });
  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        Text(title, style: theme.textTheme.labelLarge),
        Gap(5),
        TextFormField(
          cursorColor: theme.colorScheme.onPrimary,
          style: theme.textTheme.labelLarge,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            hintText: hintText,
            hintStyle: theme.textTheme.labelLarge?.copyWith(
              color: AppColors.textHint,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.primary),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onSurface.withAlpha(100),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.error),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: theme.colorScheme.surface.withAlpha(100),
          ),
        ),
      ],
    );
  }
}
