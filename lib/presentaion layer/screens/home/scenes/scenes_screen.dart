import 'package:flutter/material.dart';

import '../empty_screen.dart';
import 'scenes_list_view.dart';

class ScenesScreen extends StatelessWidget {
  const ScenesScreen({Key? key}) : super(key: key);

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const EmptyScreen(
            title: 'NO SCENES YET',
            subtitle: 'YOUR SCENES WILL APPEAR HERE',
            img: 'assets/images/empty.png',
          )
        : const ScenesListView();
  }
}
