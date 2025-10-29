import 'package:evently_sun_online/config/theme/theme_manager.dart';
import 'package:evently_sun_online/core/prefs_manager/prefs_manager.dart';
import 'package:evently_sun_online/core/routes_manager/app_routes.dart';
import 'package:evently_sun_online/core/routes_manager/router.dart';
import 'package:evently_sun_online/firebase/firebase_service.dart';
import 'package:evently_sun_online/l10n/app_localizations.dart';
import 'package:evently_sun_online/models/user_model.dart';
import 'package:evently_sun_online/providers/language_provider.dart';
import 'package:evently_sun_online/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  await Firebase.initializeApp();
if(FirebaseAuth.instance.currentUser != null){
 UserModel.currentUser = await FirebaseService.getUserFromFireStore(FirebaseAuth.instance.currentUser!.uid);
}
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ThemeProvider()),
        ChangeNotifierProvider(create: (context)=> LanguageProvider()),
      ],
      child: Evently()));
}

class Evently extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var themeProvider =Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);


    return ScreenUtilInit(
      designSize:Size(393, 841) ,
      splitScreenMode: true,
      minTextAdapt: true,
      builder:(context, _)=>   MaterialApp(
        debugShowCheckedModeBanner: false,

        onGenerateRoute: RoutesManager.router,
        initialRoute:
        FirebaseAuth.instance.currentUser ==  null ? AppRoutes.login : AppRoutes.mainLayout,
        themeMode: themeProvider.currentTheme,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        locale: Locale(langProvider.currentLang),
        localizationsDelegates:AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale("en"),
          Locale("ar"),
        ],
      ),

    );
  }
}
