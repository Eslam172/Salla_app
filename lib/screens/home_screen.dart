import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:salla_app/shared/cubit/cubit.dart';
import 'package:salla_app/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  var bottomNavController = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return PersistentTabView(
            context,
            onItemSelected: (int index){
              cubit.changeBottomNav(index);
            },
            controller: bottomNavController,
            screens: cubit.bottomScreens,
            items: [
              PersistentBottomNavBarItem(
                icon:  const ImageIcon(AssetImage('assets/images/home.png')),
                title: ("HOME"),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.white,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600
                )
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.square_grid_2x2),
                title: ("CATEGORIES"),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.white,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600
                  )
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.heart_solid),
                title: ("FAVORITES"),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.white,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600
                  )
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.profile_circled),
                title: ("PROFILE"),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.white,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600
                  )
              ),
            ],
            backgroundColor: const Color(0xff454D5A), // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: const NavBarDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
              ),
              colorBehindNavBar:  Color(0xff333742),
            ),
            itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            navBarStyle: NavBarStyle.style1,
          );
      },
    );
  }
}
