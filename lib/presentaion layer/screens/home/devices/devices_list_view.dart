import 'package:flutter/material.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const DevicesListItem();
      },
      itemCount: 5,
    );
  }
}

class DevicesListItem extends StatelessWidget {
  const DevicesListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepOrange, borderRadius: BorderRadius.circular(16)),
    );
  }
}
