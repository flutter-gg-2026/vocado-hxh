import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/navigation/routers.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mic),
          label: 'Team',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          label: 'Task Boards',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            context.go(Routes.voice);
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
        }
      },
    );
  }
}