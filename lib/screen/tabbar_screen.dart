import 'package:flutter/material.dart';
import 'package:hairdisease/screen/skintips_screen.dart';
import 'package:hairdisease/screen/tutorials_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../viewmodel/tabbar_viewmodel.dart';
import 'hairtips_screen.dart';
import 'home_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenViewModel>(
      builder: (context, viewModel, _) {
        return PersistentTabView(
          context,
          controller: viewModel.tabController,
          screens:  [
            const HomeScreen(),
            const HairTipsScreen(),
            HairDisease(),
            TutorialsScreen(), // New tab
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: Icon(Icons.home),
              title: 'Home',
              activeColorPrimary: Colors.blue,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.tips_and_updates_sharp),
              title: 'Hair Tips',
              activeColorPrimary: Colors .blue,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.spatial_audio_outlined),
              title: 'Hair disease',
              activeColorPrimary: Colors.blue,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.app_blocking_sharp),
              title: 'Tutorial',
              activeColorPrimary: Colors.blue,
              inactiveColorPrimary: Colors.grey,
            ),
          ],
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 400),
          ),
          navBarStyle:
              NavBarStyle.style1, // Choose the style that suits your needs
        );
      },
    );
  }
}
