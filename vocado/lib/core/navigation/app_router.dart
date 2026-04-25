import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/features/task_creator/presentation/pages/error_screen.dart';
import 'package:vocado/features/task_creator/presentation/pages/task_review_screen.dart';
import 'package:vocado/features/task_creator/presentation/pages/voice_screen.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/pages/task_viewer_feature_screen.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.voice,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),

      GoRoute(
        path: Routes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(GetIt.I.get()),
          child: const AuthFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.taskCreator,
        builder: (context, state) => BlocProvider(
          create: (context) => TaskCreatorCubit(GetIt.I.get()),
          child: const TaskCreatorFeatureScreen(),
        ),
      ),
      GoRoute(
        path: Routes.voice,
        builder: (context, state) => BlocProvider(
          create: (context) => TaskCreatorCubit(GetIt.I.get()),
          child: const VoiceScreen(),
        ),
      ),
      GoRoute(
        path: Routes.error,
        builder: (context, state) => BlocProvider(
          create: (context) => TaskCreatorCubit(GetIt.I.get()),
          child: const ErrorScreen(),
        ),
      ),
      GoRoute(
        path: Routes.taskReviw,
        builder: (context, state){
          final task = state.extra as TaskEntity;
          return BlocProvider(
            create: (context) => TaskCreatorCubit(GetIt.I.get()),
            child: TaskReviewScreen(task: task),
          );
        },
      ),

      GoRoute(
        path: Routes.taskViewer,
        builder: (context, state) => BlocProvider(
          create: (context) => TaskViewerCubit(GetIt.I.get()),
          child: const TaskViewerFeatureScreen(),
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
