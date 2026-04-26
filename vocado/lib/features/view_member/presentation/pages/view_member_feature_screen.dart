import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/widgets/buttons/custom_button.dart';
import 'package:vocado/features/view_member/presentation/cubit/view_member_cubit.dart';
import 'package:vocado/features/view_member/presentation/cubit/view_member_state.dart';
import 'package:vocado/features/view_member/presentation/widgets/user_card.dart';

class ViewMemberFeatureScreen extends StatelessWidget {
  const ViewMemberFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<ViewMemberCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Team')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ViewMemberCubit, ViewMemberState>(
            builder: (context, state) {
              if (state is ViewMemberSuccessState) {
                return Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.users.length,
                      itemBuilder: (context, index) =>
                          UserCard(user: state.users[index]),
                    ),

                    CustomButton(title: "Add Member", onPressed: () {}),
                  ],
                );
              }
              return Center(child: Text("Error"));
            },
          ),
        ),
      ),
    );
  }
}
