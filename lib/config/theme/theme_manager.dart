import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager{
  static final ThemeData light = ThemeData(
      iconTheme: IconThemeData(
        color: ColorsManager.black,
      ),
      cardTheme: CardThemeData(

          color: ColorsManager.white,
          elevation: 12,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r)
          )
      ),
    primaryColor: ColorsManager.blue,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.whiteBlue,
      foregroundColor: ColorsManager.blue,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400, color: ColorsManager.blue,fontSize:  22.sp)
    ),
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      foregroundColor: ColorsManager.white,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.white, width: 4.w)
      )
    ),
      bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: ColorsManager.blue,
      elevation: 12,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),
      hintStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),

      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r)
        ),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.whiteBlue,
        textStyle: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)

      )
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w400,
      ),
      titleMedium:GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.black,
        fontWeight: FontWeight.w500,
      ) ,
      titleLarge:GoogleFonts.inter(
        fontSize: 24.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        color: ColorsManager.blue,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsManager.black),
      bodyMedium: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.black),

    headlineMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.black),
    labelMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue),

    )
  );
  static final ThemeData dark = ThemeData(
    iconTheme: IconThemeData(
      color: ColorsManager.ofWhite,
    ),
    cardTheme: CardThemeData(

      color: ColorsManager.darkBlue,
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r)
      )
    ),
      primaryColor: ColorsManager.darkBlue,

      useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.darkBlue,
      foregroundColor: ColorsManager.blue,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400, color: ColorsManager.blue,fontSize:  22.sp)
    ),
    scaffoldBackgroundColor: ColorsManager.darkBlue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.darkBlue,
      foregroundColor: ColorsManager.ofWhite,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.ofWhite, width: 4.w)
      )
    ),
      bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: ColorsManager.darkBlue,
      elevation: 12,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: ColorsManager.ofWhite,
      unselectedItemColor: ColorsManager.ofWhite
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),
      hintStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),

      prefixIconColor: ColorsManager.ofWhite,
      suffixIconColor: ColorsManager.ofWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r)
        ),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.whiteBlue,
        textStyle: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)

      )
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        color: ColorsManager.ofWhite,
        fontWeight: FontWeight.w400,
      ),
      titleMedium:GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.ofWhite,
        fontWeight: FontWeight.w500,
      ) ,
      titleLarge:GoogleFonts.inter(
        fontSize: 24.sp,
        color: ColorsManager.ofWhite,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        color: ColorsManager.darkBlue,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsManager.ofWhite),
        bodyMedium: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.ofWhite),

    headlineMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.ofWhite),
    labelMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue, ),

    )
  );

}
