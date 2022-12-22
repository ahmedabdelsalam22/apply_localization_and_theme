import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinric_app/shared/color_manager.dart';

import '../../../widgets/text_widget.dart';

class ActivityLogListItemBuilder extends StatelessWidget {
  const ActivityLogListItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: TextWidget(
                text: '15/2/2022',
                textSize: 20.sp,
                color: ColorManager.primary,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Log in with email and password',
                    textSize: 20.sp,
                    color: ColorManager.primary,
                  ),
                  TextWidget(
                    text: '${DateTime.now()}',
                    textSize: 20.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
              Icon(
                Icons.help,
                color: ColorManager.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
