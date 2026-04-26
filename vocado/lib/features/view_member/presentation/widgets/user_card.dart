import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/common/entities/user/user_entity.dart';
import 'package:vocado/core/extensions/font_extensions.dart';
import 'package:vocado/features/view_member/presentation/widgets/user_container.dart';

/// A UI card widget that displays user information such as name,
/// specialty, role, and avatar icon in a styled container.
class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 55.sizeSW(min: 161, max: 280),

      width: 60.sizeSW(min: 244, max: 388),

      margin: EdgeInsets.all(10),

      padding: EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withAlpha(130),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment: .center,

        crossAxisAlignment: .center,

        children: [
          // User avatar icon
          Icon(Icons.person, size: 7.sh, color: theme.colorScheme.primary),

          // User name
          Text(
            user.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium,
            softWrap: true,
          ),

          Gap(5),

          // User specialty
          Text(
            user.specialty,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelLarge,
            softWrap: true,
          ),

          Gap(5),

          Userontainer(role: user.role),
        ],
      ),
    );
  }
}
