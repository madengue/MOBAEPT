import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafacture/component/colors.dart';
import 'package:mafacture/views/historique/historique_paiement.dart';
import 'package:mafacture/views/home/homePage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late PersistentTabController controller;

  // List pages = [
  //   MainFoodPage(),
  //   Container(
  //     child: Center(
  //       child: Text("En cours"),
  //     ),
  //   ),
  //   Container(
  //     child: Center(
  //       child: Text("En cours"),
  //     ),
  //   ),
  //   Container(
  //     child: Center(
  //       child: Text("En cours"),
  //     ),
  //   ),
  // ];

  // void onTapNav(int index) {
  //   setState(() {
  //     _seletectedIndex = index;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const HistoriquesPaiements(),
      //const Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Acceuil"),
        //activeColorPrimary: CupertinoColors.activeBlue,
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.archivebox_fill),
        title: ("Historiques"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      // PersistentBottomNavBarItem(
      //   icon: const Icon(CupertinoIcons.person_2),
      //   title: ("Moi"),
      //   activeColorPrimary: AppColor.mainColor,
      //   inactiveColorPrimary: CupertinoColors.systemGrey,
      // ),
      // PersistentBottomNavBarItem(
      //   icon: const Icon(CupertinoIcons.person),
      //   title: ("Me"),
      //   activeColorPrimary: AppColor.mainColor,
      //   inactiveColorPrimary: CupertinoColors.systemGrey,
      // ),
    ];
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[_seletectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       selectedItemColor: AppColor.mainColor,
  //       unselectedItemColor: AppColor.mainsColor,
  //       showSelectedLabels: false,
  //       showUnselectedLabels: false,
  //       currentIndex: _seletectedIndex,
  //       selectedFontSize: 0.0,
  //       unselectedFontSize: 0.1,
  //       onTap: onTapNav,
  //       items: const [
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             Icons.home_max,
  //           ),
  //           label: "Discover",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(CupertinoIcons.home
  //               // Icons.archive,
  //               ),
  //           label: "History",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             Icons.shopping_cart,
  //           ),
  //           label: "Cart",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             Icons.person,
  //           ),
  //           label: "Account",
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
