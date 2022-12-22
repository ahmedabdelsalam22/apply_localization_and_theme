import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/text_widget.dart';

class EmptyScreen extends StatelessWidget {
  final String title, subtitle, img;

  const EmptyScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(img),
          height: 150.h,
          width: 150.w,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextWidget(
          text: title,
          color: Colors.deepOrange,
          textSize: 20.sp,
        ),
        TextWidget(
          text: subtitle,
          color: Colors.deepOrange,
          textSize: 20.sp,
        )
      ],
    );
  }
}
