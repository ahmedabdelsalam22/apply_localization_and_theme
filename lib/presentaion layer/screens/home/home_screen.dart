import 'package:flutter/material.dart';
import 'package:sinric_app/presentaion%20layer/screens/home/rooms/rooms_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/home/scenes/scenes_screen.dart';
import 'package:sinric_app/presentaion%20layer/widgets/text_widget.dart';
import 'package:sinric_app/shared/color_manager.dart';

import '../../../notification_services/localization/applocal.dart';
import '../../widgets/my_drawer.dart';
import 'devices/devices_screen.dart';

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
            DevicesScreen(),
            RoomsScreen(),
            ScenesScreen(),
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
            height: MediaQuery.of(context).size.height * 0.3,
            alignment: Alignment.center,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bottomSheetItem(
                      title: 'Add Device',
                      subtitle: 'Connect smart home devices to your account',
                      onPressed: () {}),
                  const Divider(),
                  bottomSheetItem(
                      title: 'Add Room',
                      subtitle: 'Create new rooms and group devices together',
                      onPressed: () {}),
                  const Divider(),
                  bottomSheetItem(
                      title: 'Add Scene',
                      subtitle:
                          'Scene let your control multiple devices together',
                      onPressed: () {})
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
            TextWidget(
                text: subtitle, color: ColorManager.primary, textSize: 15),
          ],
        ),
      ),
    );
  }
}
