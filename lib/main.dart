import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/layout/layout_screen.dart';
import 'package:news/providers/mu_provider.dart';
import 'package:news/screens/new_content_screen.dart';
import 'package:news/screens/setting_screen.dart';
import 'package:news/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          locale: Locale(pro.local),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          routes: {
            HomeLayout.routeName: (context) => HomeLayout(),
            SplashScreen.routeName: (context) => SplashScreen(),
            NewContentScreen.routeName: (context) => NewContentScreen(),
            SettingScreen.routeName: (context) => SettingScreen()
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
