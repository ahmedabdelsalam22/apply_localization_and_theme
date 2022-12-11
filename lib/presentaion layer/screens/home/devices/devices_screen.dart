import 'package:flutter/material.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';

import '../empty_screen.dart';
import 'devices_list_view.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? EmptyScreen(
            title: getLang(context, 'no_devices_yet'),
            subtitle: getLang(context, 'your_devices_will_appear_here'),
            img: 'assets/images/empty.png',
          )
        : const DevicesListView();
  }
}
