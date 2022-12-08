import 'package:flutter/material.dart';

import '../../../shared/color_manager.dart';
import '../../widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backGround,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: backGround,
          centerTitle: true,
          title: const Text(
            'Home',
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          /* leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.read_more_sharp,
              color: Colors.deepOrange,
              size: 30,
            ),
          ),*/
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.deepOrange,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.refresh_sharp,
                color: Colors.deepOrange,
                size: 30,
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorWeight: 3.0,
            indicatorColor: Colors.deepOrange,
            labelColor: Colors.deepOrange,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: 'DEVICES',
              ),
              Tab(
                text: 'ROOMS',
              ),
              Tab(
                text: 'SCENES',
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
