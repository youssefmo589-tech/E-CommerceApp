import 'package:ecommerce/features/layoutView/presentation/layoutviewPage/Home.dart';
import 'package:flutter/material.dart';

import '../../../../Widgets/CustomDrawer.dart';
import '../../../../core/Theme/AppColors/AppColors.dart';
import 'Favourite.dart';
import 'Profile.dart';

class LayoutViewPage extends StatefulWidget {
  const LayoutViewPage({super.key});

  State<LayoutViewPage> createState() => _LayoutViewPageState();
}

class _LayoutViewPageState extends State<LayoutViewPage> {
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    List<Widget> pages = [Home(), Profile(), Favourite()];

    final theme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: Customdrawer(),

      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteapp,
        selectedItemColor: AppColors.darkpurple,
        unselectedItemColor: AppColors.darkgrey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedLabelStyle: theme.titleSmall?.copyWith(
          fontSize: 14,
          color: AppColors.darkpurple,
        ),
        unselectedLabelStyle: theme.titleSmall?.copyWith(
          fontSize: 14,
          color: AppColors.darkgrey,
        ),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 24),
            label: "Home",
            activeIcon: Icon(
              Icons.home_filled,
              size: 24,
              color: AppColors.darkpurple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded, size: 24),
            label: "Favourite",
            activeIcon: Icon(
              Icons.favorite_outline_rounded,
              size: 24,
              color: AppColors.darkpurple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 24),
            label: "Profile",
            activeIcon: Icon(
              Icons.person_outline,
              size: 24,
              color: AppColors.darkpurple,
            ),
          ),
        ],
      ),
    );
  }
}
