import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:evently_sun_online/core/widgets/custom_tab_bar.dart';
import 'package:evently_sun_online/core/widgets/event_item.dart' show EventItem;
import 'package:evently_sun_online/core/widgets/tab_item.dart';
import 'package:evently_sun_online/models/category_model.dart';
import 'package:evently_sun_online/models/event_model.dart';
import 'package:evently_sun_online/providers/language_provider.dart';
import 'package:evently_sun_online/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
    return Column(
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical: 24),
          width: double.infinity,

          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back ✨",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "Muhammed Saad",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ColorsManager.white,
                              ),
                              Text(
                                "Cairo, Egypt",
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                         themeProvider.changeAppTheme(themeProvider.isDark ?  ThemeMode.light : ThemeMode.dark);
                        },
                        icon: Icon(
                        themeProvider.isDark?  Icons.dark_mode: Icons.light_mode,
                          color: ColorsManager.white,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      InkWell(
                        onTap: (){
                          langProvider.changeAppLang(langProvider.isEnglish ? "ar": "en");
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              langProvider.isEnglish ? "Ar": "En",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTabBar(
                  categories: CategoryModel.getCategoriesWithAll(context),
                  selectedBgColor: ColorsManager.whiteBlue,
                  selectedFgColor: ColorsManager.blue,
                  unSelectedBgColor: Colors.transparent,
                  unSelectedFgColor: ColorsManager.whiteBlue,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => EventItem(
              event: EventModel(
                category: CategoryModel.getCategories(context)[2],
                title: "Meeting for Updating The Development Method ",
                description: "Meeting for Updating The Development Method ",
                dateTime: DateTime.now(),
                timeOfDay: TimeOfDay.now(),
              ),
            ),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
