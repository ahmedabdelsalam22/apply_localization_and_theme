import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinric_app/presentaion%20layer/screens/splash_screen.dart';
import 'package:sinric_app/shared/app_router/app_router.dart';
import 'package:sinric_app/shared/applocal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool arabicLang = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'pro',
              primaryColor: Colors.deepOrange,
              primarySwatch: Colors.deepOrange),
          home: const SplashScreen(),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.homeScreenRoute,
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
          locale: arabicLang ? const Locale("ar", "") : const Locale("en", ""),
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
  }
}
