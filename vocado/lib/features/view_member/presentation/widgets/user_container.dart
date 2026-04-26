import 'package:flutter/material.dart';

/// A simple UI widget that displays the user's role inside a styled container.
/// Example: "Admin" or "User"
class Userontainer extends StatelessWidget {
  final String role;

  const Userontainer({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // Access current theme for consistent styling (colors, text styles)
    final theme = Theme.of(context);

    return Container(
      // Inner spacing around the text
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),

      // Rounded border styling for pill-shaped UI
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        // Border color matches app primary theme color
        border: Border.all(color: theme.colorScheme.primary, width: 2),
      ),

      child: Text(
        role,

        // Style text using theme with small customization
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
