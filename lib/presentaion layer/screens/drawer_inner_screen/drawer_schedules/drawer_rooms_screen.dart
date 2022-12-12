import 'package:flutter/material.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';
import 'package:sinric_app/presentaion%20layer/widgets/text_widget.dart';
import 'package:sinric_app/shared/color_manager.dart';

class DrawerSchedulesScreen extends StatelessWidget {
  const DrawerSchedulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: ColorManager.backGround,
        title: TextWidget(
          text: getLang(context, 'schedules'),
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
      /* body: ListView.builder(
        itemBuilder: (context, index) {
          return DrawerSchedulesItemList(title: getLang(context, 'living_Room'));
        },
        itemCount: 5,
      ),*/
    );
  }
}

class DrawerSchedulesItemList extends StatelessWidget {
  final String title;

  const DrawerSchedulesItemList({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: 150,
          child: Center(
            child: ListTile(
              title: TextWidget(
                text: title,
                color: Colors.black,
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
