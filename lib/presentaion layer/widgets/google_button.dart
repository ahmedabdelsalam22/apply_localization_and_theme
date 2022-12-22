import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../notification_services/localization/applocal.dart';
import '../../shared/color_manager.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.primary,
      child: InkWell(
        onTap: () {
          ///
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/images/google.png',
                  width: 40.w,
                )),
            SizedBox(width: 8.w),
            Text(
              getLang(context, "Sign_in_with_google"),
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
