import 'package:flutter/material.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';
import 'package:sinric_app/presentaion%20layer/widgets/text_widget.dart';
import 'package:sinric_app/shared/color_manager.dart';

import 'activity_log_list_item_builder.dart';

class DrawerActivityLogScreen extends StatelessWidget {
  const DrawerActivityLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      appBar: AppBar(
        backgroundColor: ColorManager.backGround,
        elevation: 0.0,
        centerTitle: true,
        title: TextWidget(
          isTitle: true,
          text: getLang(context, "activityLog"),
          textSize: 20,
          color: ColorManager.primary,
        ),
        actions: const [Icon(Icons.refresh_sharp)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const ActivityLogListItemBuilder();
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
