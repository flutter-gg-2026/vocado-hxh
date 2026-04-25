import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/add_member/presentation/cubit/add_member_cubit.dart';

class AddMemberFeatureScreen extends StatelessWidget {
  const AddMemberFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<AddMemberCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('AddMember Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
