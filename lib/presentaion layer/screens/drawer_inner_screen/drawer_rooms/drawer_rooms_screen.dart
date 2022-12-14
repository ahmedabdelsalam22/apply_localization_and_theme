import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';
import 'package:sinric_app/presentaion%20layer/widgets/text_widget.dart';
import 'package:sinric_app/shared/color_manager.dart';

import '../../../../shared/dark_theme_services/dark_theme_provider.dart';

class DrawerRoomsScreen extends StatelessWidget {
  const DrawerRoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: TextWidget(
          text: getLang(context, 'rooms'),
          color: ColorManager.primary,
          textSize: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return DrawerRoomsItemList(title: getLang(context, 'living_Room'));
        },
        itemCount: 5,
      ),
    );
  }
}

class DrawerRoomsItemList extends StatelessWidget {
  final String title;

  const DrawerRoomsItemList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 150,
          child: Center(
            child: ListTile(
              title: TextWidget(
                text: title,
                color: isDark ? Colors.white : Colors.black,
                textSize: 20,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.perm_device_info),
            ),
          ),
        ),
      ),
    );
  }
}
