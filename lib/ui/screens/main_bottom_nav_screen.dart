
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:task_manager_app/ui/screens/cancel_task_screen.dart';
import 'package:task_manager_app/ui/screens/complete_task_screen.dart';
import 'package:task_manager_app/ui/screens/new_task_screen.dart';
import 'package:task_manager_app/ui/screens/progress_task_screen.dart';
import 'package:task_manager_app/ui/widgets/custom_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> screens = const [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompleteTaskScreen(),
    CancelTaskScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: GNav(
        activeColor: AppColors.baseDarkGreenColor,
        color: AppColors.baseGrey50Color,
        tabBackgroundColor: AppColors.baseLightPinkColor,
        backgroundColor: AppColors.baseGrey20Color,
        tabBorderRadius: 9,
       gap: 1,
       //tabMargin: EdgeInsets.only(left: 5),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'New Task ',
            ),
            GButton(
              icon: Icons.sync_sharp,
              text: 'Progress',
            ),
            GButton(
              icon: Icons.done,
              text: 'Completed',
            ),
            GButton(
              icon: Icons.close_rounded,
              text: 'Cancelled',
            )
          ],
    selectedIndex: _selectedIndex,
    onTabChange: (index) {
      setState(() {
        _selectedIndex = index;
      }
      );
    }
    ),
      body: screens[_selectedIndex],
    );
  }
}
