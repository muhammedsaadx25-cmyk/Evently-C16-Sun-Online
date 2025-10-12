import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:evently_sun_online/core/routes_manager/app_routes.dart';
import 'package:evently_sun_online/features/main_layout/favourite_tab/favourite_tab.dart';
import 'package:evently_sun_online/features/main_layout/home_tab/home_tab.dart';
import 'package:evently_sun_online/features/main_layout/map_tab/map_tab.dart';
import 'package:evently_sun_online/features/main_layout/profile_tab/profile_tab.dart';
import 'package:evently_sun_online/l10n/app_localizations.dart' show AppLocalizations;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [HomeTab(), MapTab(), FavouriteTab(), ProfileTab()];
  int selectedIndex = 0;
late AppLocalizations appLocalizations;
  @override
  Widget build(BuildContext context) {
   appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      body: tabs[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: _buildFab(),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(onPressed: () {
      Navigator.pushNamed(context, AppRoutes.createEvent);
    }, child: Icon(Icons.add));
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      notchMargin: 8,
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onTap,

        items: [
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: appLocalizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 1
                  ? Icons.location_on
                  : Icons.location_on_outlined,
            ),
            label: appLocalizations.map,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 2 ? Icons.favorite : Icons.favorite_border,
            ),
            label: appLocalizations.favourite,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 3 ? Icons.person : Icons.person_2_outlined,
            ),
            label: appLocalizations.profile,
          ),
        ],
      ),
    );
  }

  void _onTap(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
