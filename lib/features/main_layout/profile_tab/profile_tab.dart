import 'package:evently_sun_online/core/resources/assets_manager.dart';
import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:evently_sun_online/features/main_layout/profile_tab/custom_drop_down_item.dart';
import 'package:evently_sun_online/l10n/app_localizations.dart' show AppLocalizations;
import 'package:evently_sun_online/providers/language_provider.dart';
import 'package:evently_sun_online/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
var themeProvider = Provider.of<ThemeProvider>(context);
var langProvider = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,

          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36.r)),
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                Image.asset(ImageAssets.profileImage),
                SizedBox(width: 16.sp),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Moo Saad",
                      style: GoogleFonts.inter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white,
                      ),
                    ),
                    Text(
                      "mmoosaad@gmail.com",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.sp),
        CustomDropDownItem(
          onChange: (newTheme){
           themeProvider.changeAppTheme(newTheme == appLocalizations.light? ThemeMode.light : ThemeMode.dark);
          },
          label: appLocalizations.theme,
          selectedLabel: themeProvider.isDark ? appLocalizations.dark : appLocalizations.light,
          menuItems: [appLocalizations.light, appLocalizations.dark],
        ),
        SizedBox(height: 16.h),
        CustomDropDownItem(
          onChange: (newLang){
           langProvider.changeAppLang(newLang == "English" ? "en" : "ar") ;
          },
          label: appLocalizations.language,
          selectedLabel: langProvider.isEnglish ? "English" : "Arabic",
          menuItems: ["English", "Arabic"],
        ),
        Spacer(flex: 7),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              backgroundColor: ColorsManager.red,
              foregroundColor: ColorsManager.white,
              textStyle: GoogleFonts.inter(
                color: ColorsManager.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 8.w),
                Text(appLocalizations.logout),
              ],
            ),
          ),
        ),
        Spacer(flex: 3),
      ],
    );
  }
}
