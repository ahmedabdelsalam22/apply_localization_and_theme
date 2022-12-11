import 'package:flutter/material.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';

import '../empty_screen.dart';
import 'scenes_list_view.dart';

class ScenesScreen extends StatelessWidget {
  const ScenesScreen({Key? key}) : super(key: key);

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? EmptyScreen(
            title: getLang(context, 'no_scenes_yet'),
            subtitle: getLang(context, 'your_scenes_will_appear_here'),
            img: 'assets/images/empty.png',
          )
        : const ScenesListView();
  }
}
