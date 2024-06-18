import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TabScreenViewModel extends ChangeNotifier {
  PersistentTabController? tabController;
  int selectedTabIndex = 0;

  TabScreenViewModel() {
    tabController = PersistentTabController(initialIndex: selectedTabIndex);
    tabController?.addListener(() {
      selectedTabIndex = tabController!.index;
      notifyListeners();
    });
  }

  void setTabIndex(int index) {
    tabController?.jumpToTab(index);
    selectedTabIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}
