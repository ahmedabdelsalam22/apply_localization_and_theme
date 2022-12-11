import 'package:flutter/material.dart';

class ScenesListView extends StatelessWidget {
  const ScenesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ScenesListItem();
      },
      itemCount: 5,
    );
  }
}

class ScenesListItem extends StatelessWidget {
  const ScenesListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepOrange, borderRadius: BorderRadius.circular(16)),
    );
  }
}
