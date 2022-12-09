import 'package:flutter/material.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';

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
            color: Colors.blue[100],
          ),
          child: const Image(
            fit: BoxFit.cover,
            height: 100,
            width: 100,
            image: AssetImage(
              'assets/images/splash.png',
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'userName',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'user email',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 280,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: buildDrawerHeader(context),
            ),
          ),
          buildDrawerListItem(
            leadingIcon: Icons.meeting_room_rounded,
            title: getLang(context, 'rooms'),
            onTap: () {},
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.schedule,
            title: getLang(context, 'schedules'),
            onTap: () {},
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.video_settings_sharp,
            title: getLang(context, 'scenes'),
            onTap: () {},
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.person,
            title: getLang(context, 'account'),
            onTap: () {},
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.history,
            title: getLang(context, 'activityLog'),
            onTap: () {},
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.logout,
            title: getLang(context, 'logOff'),
            onTap: () {},
          ),
          buildDrawerListItemsDivider(),
        ],
      ),
    );
  }
}
