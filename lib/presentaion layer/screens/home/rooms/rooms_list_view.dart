import 'package:flutter/material.dart';

class RoomsListView extends StatelessWidget {
  const RoomsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const RoomsListItem();
      },
      itemCount: 5,
    );
  }
}

class RoomsListItem extends StatelessWidget {
  const RoomsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepOrange, borderRadius: BorderRadius.circular(16)),
    );
  }
}
