import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/widgets/buttons/custom_button.dart';
import 'package:vocado/features/view_member/presentation/cubit/view_member_cubit.dart';
import 'package:vocado/features/view_member/presentation/cubit/view_member_state.dart';
import 'package:vocado/features/view_member/presentation/widgets/user_card.dart';

/// Screen that displays all team members and allows adding new members
class ViewMemberFeatureScreen extends StatelessWidget {
  const ViewMemberFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.read<ViewMemberCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team'),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: BlocBuilder<ViewMemberCubit, ViewMemberState>(
            builder: (context, state) {
              // Success state: show list of users + add button
              if (state is ViewMemberSuccessState) {
                return Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,

                  children: [
                    // List of team members
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.users.length,
                      itemBuilder: (context, index) =>
                          UserCard(user: state.users[index]),
                    ),

                    // Button to add a new member
                    CustomButton(
                      title: "Add Member",
                      onPressed: () {},
                    ),
                  ],
                );
              }

              // Fallback UI for error or other states
              return const Center(
                child: Text("Error"),
              );
            },
          ),
        ),
      ),
    );
  }
}