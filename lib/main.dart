import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sinric_app/presentaion%20layer/screens/splash/splash_screen.dart';
import 'package:sinric_app/shared/app_router.dart';
import 'package:sinric_app/shared/dark_theme_services/dark_theme_provider.dart';
import 'package:sinric_app/shared/localization_provider/localization_provider.dart';
import 'package:sinric_app/shared/theme_const/themes.dart';

import 'notification_services/localization/applocal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool arabicLang = false;

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  LocalizationProvider localizationProvider = LocalizationProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  void getCurrentAppLang() async {
    localizationProvider.setArabicLang =
        await localizationProvider.localizationPrefs.getLang();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    getCurrentAppLang();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => themeChangeProvider),
            ChangeNotifierProvider(create: (_) => localizationProvider),
          ],
          builder: (context, child) {
            final themeProvider = Provider.of<DarkThemeProvider>(context);
            final langProvider = Provider.of<LocalizationProvider>(context);

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeProvider.getDarkTheme, context),
              home: const SplashScreen(),
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: AppRoutes.splashScreenRoute,
              localizationsDelegates: const [
                AppLocale.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [
                Locale("en", ""),
                Locale("ar", ""),
              ],
              locale: langProvider.getArabicLang
                  ? const Locale("ar", "")
                  : const Locale("en", ""),
              localeResolutionCallback: (currentLang, supportLang) {
                if (currentLang != null) {
                  for (Locale locale in supportLang) {
                    if (locale.languageCode == currentLang.languageCode) {
                      return currentLang;
                    }
                  }
                }
                return supportLang.first;
              },
            );
          },
        );
      },
    );
  }
}
