import 'package:flutter/material.dart';

import '../../../notification_services/localization/applocal.dart';
import '../../../shared/color_manager.dart';
import '../../widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              onPressed: () {},
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
            Center(
              child: Image(
                image: AssetImage('assets/images/smart_tv.png'),
                height: 150,
                width: 150,
              ),
            ),
            Center(
              child: Image(
                image: AssetImage('assets/images/room_temperature.png'),
                height: 150,
                width: 150,
              ),
            ),
            Center(
              child: Image(
                image: AssetImage('assets/images/smart_lock.png'),
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
