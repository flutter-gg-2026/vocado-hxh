import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/features/task_viewer/sub/board/presentation/cubit/board_cubit.dart';


class BoardFeatureWidget extends StatelessWidget {
  const BoardFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<BoardCubit>();
          return Column(children: [
              
              ],
            );
        },
      ),
    );
  }
}
