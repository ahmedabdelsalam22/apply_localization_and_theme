import 'package:flutter/material.dart';

import '../empty_screen.dart';
import 'devices_list_view.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const EmptyScreen(
            title: 'NO DEVICES YET',
            subtitle: 'YOUR DEVICES WILL APPEAR HERE',
            img: 'assets/images/empty.png',
          )
        : const DevicesListView();
  }
}
