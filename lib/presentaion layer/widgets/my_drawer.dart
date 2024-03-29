import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';
import 'package:sinric_app/shared/dark_theme_services/dark_theme_provider.dart';
import 'package:sinric_app/shared/localization_provider/localization_provider.dart';

import '../../shared/app_router.dart';
import '../../shared/color_manager.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget buildDrawerHeader(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).cardColor,
          ),
          child: Image(
            fit: BoxFit.cover,
            height: 70.h,
            width: 70.w,
            image: AssetImage(
              'assets/images/splash.png',
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'userName',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'user email',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          'First release version',
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildDrawerListItem(
      {required IconData leadingIcon,
      required String title,
      Widget? trailing,
      Function()? onTap,
      Color? color}) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: color ?? ColorManager.primary,
      ),
      title: Text(title),
      trailing: trailing ??= Icon(
        Icons.arrow_right,
        color: ColorManager.primary,
      ),
      onTap: onTap,
    );
  }

  Widget buildDrawerListItemsDivider() {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;

    final langState = Provider.of<LocalizationProvider>(context);
    bool isArabic = langState.getArabicLang;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 240.h,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: buildDrawerHeader(context),
            ),
          ),
          buildDrawerListItem(
            leadingIcon: Icons.meeting_room_rounded,
            title: getLang(context, 'rooms'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.drawerRoomsScreenRoute);
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.schedule,
            title: getLang(context, 'schedules'),
            onTap: () {
              Navigator.pushNamed(
                  context, AppRoutes.drawerSchedulesScreenRoute);
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.video_settings_sharp,
            title: getLang(context, 'scenes'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.drawerScenesScreenRoute);
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.person,
            title: getLang(context, 'account'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.accountScreenRoute);
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.history,
            title: getLang(context, 'activityLog'),
            onTap: () {
              Navigator.pushNamed(
                  context, AppRoutes.drawerActivityLogScreenRoute);
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.confirmation_number_outlined,
            title: getLang(context, 'config'),
            onTap: () {
              // TODO
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.help_outline,
            title: getLang(context, 'technicalSupport'),
            onTap: () {
              // TODO
            },
          ),
          buildDrawerListItemsDivider(),
          //
          SwitchListTile(
            title: Text(
              isArabic
                  ? getLang(context, "arabic")
                  : getLang(context, "english"),
            ),
            activeColor: ColorManager.primary,
            secondary: Icon(
              Icons.language,
              color: ColorManager.primary,
            ),
            value: isArabic,
            onChanged: (bool value) {
              langState.setArabicLang = value;
            },
          ),
          buildDrawerListItemsDivider(),
          SwitchListTile(
            title: Text(
              isDark
                  ? getLang(context, "light_mode")
                  : getLang(context, "dark_mode"),
            ),
            activeColor: ColorManager.primary,
            secondary: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: ColorManager.primary,
            ),
            value: isDark,
            onChanged: (bool value) {
              themeState.setDarkTheme = value;
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.logout,
            title: getLang(context, 'logOff'),
            onTap: () {
              //TODO with backend service
            },
          ),
        ],
      ),
    );
  }
}
