import 'package:flutter/material.dart';

import '../empty_screen.dart';
import 'rooms_list_view.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const EmptyScreen(
            title: 'NO ROOMS YET',
            subtitle: 'YOUR ROOMS WILL APPEAR HERE',
            img: 'assets/images/empty.png',
          )
        : const RoomsListView();
  }
}
