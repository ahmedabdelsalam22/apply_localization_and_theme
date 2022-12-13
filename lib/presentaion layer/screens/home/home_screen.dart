import 'package:flutter/material.dart';
import 'package:sinric_app/presentaion%20layer/screens/home/rooms/tabbar_rooms_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/home/scenes/tabbar_scenes_screen.dart';
import 'package:sinric_app/presentaion%20layer/widgets/text_widget.dart';
import 'package:sinric_app/shared/color_manager.dart';

import '../../../notification_services/localization/applocal.dart';
import '../../widgets/my_drawer.dart';
import 'devices/tabbar_devices_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorManager.backGround,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ColorManager.backGround,
          centerTitle: true,
          title: Text(
            getLang(context, 'home'),
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _show = !_show;
                });
              },
              icon: Icon(
                Icons.add,
                color: ColorManager.primary,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh_sharp,
                color: ColorManager.primary,
                size: 30,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 3.0,
            indicatorColor: ColorManager.primary,
            labelColor: ColorManager.primary,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: getLang(context, 'devices'),
              ),
              Tab(
                text: getLang(context, 'rooms'),
              ),
              Tab(
                text: getLang(context, 'scenes'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabBarDevicesScreen(),
            TabBarRoomsScreen(),
            TabBarScenesScreen(),
          ],
        ),
        drawer: const MyDrawer(),
        bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (context) => _showBottomSheet(),
        ),
      ),
    );
  }

  Widget _showBottomSheet() {
    if (_show) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.33,
            alignment: Alignment.center,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bottomSheetItem(
                    title: getLang(context, 'add_Device'),
                    subtitle: getLang(
                        context, 'connect_smart_home_devices_to_your_account'),
                    onPressed: () {
                      // TODO ADD DEVICE FIELD SCREEN (QR CODE)
                    },
                  ),
                  const Divider(),
                  bottomSheetItem(
                    title: getLang(context, 'add_Room'),
                    subtitle: getLang(
                        context, 'create_new_rooms_and_group_devices_together'),
                    onPressed: () {
                      // TODO  FIELD SCREEN
                    },
                  ),
                  const Divider(),
                  bottomSheetItem(
                    title: getLang(context, 'add_Scene'),
                    subtitle: getLang(context,
                        'scene_let_your_control_multiple_devices_together'),
                    onPressed: () {
                      // TODO FIELD SCREEN
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }

  Widget bottomSheetItem(
      {required String title,
      required String subtitle,
      required VoidCallback? onPressed}) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: title, color: ColorManager.primary, textSize: 15),
            TextWidget(text: subtitle, color: Colors.grey, textSize: 15),
          ],
        ),
      ),
    );
  }
}
