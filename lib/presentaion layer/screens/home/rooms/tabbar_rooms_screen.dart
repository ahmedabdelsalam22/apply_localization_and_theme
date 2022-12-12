import 'package:flutter/material.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';

import '../empty_screen.dart';
import 'rooms_list_view.dart';

class TabBarRoomsScreen extends StatelessWidget {
  const TabBarRoomsScreen({Key? key}) : super(key: key);

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? EmptyScreen(
            title: getLang(context, 'no_rooms_yet'),
            subtitle: getLang(context, 'your_rooms_will_appear_here'),
            img: 'assets/images/empty.png',
          )
        : const RoomsListView();
  }
}
