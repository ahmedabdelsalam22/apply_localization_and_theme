import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinric_app/notification_services/localization/applocal.dart';
import 'package:sinric_app/shared/color_manager.dart';

import '../../../widgets/text_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: TextWidget(
            text: getLang(context, 'account_Settings'),
            color: ColorManager.primary,
            textSize: 22.sp),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person),
              title: TextWidget(
                text: getLang(context, 'edit_personnel_information'),
                color: ColorManager.primary,
                textSize: 23.sp,
              ),
              subtitle: TextWidget(
                text: getLang(context, 'name_timezone'),
                color: Colors.grey,
                textSize: 15.sp,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.edit),
              title: TextWidget(
                text: getLang(context, 'changePassword'),
                color: ColorManager.primary,
                textSize: 23.sp,
              ),
              subtitle: TextWidget(
                text: getLang(context, 'change_your_login_password'),
                color: Colors.grey,
                textSize: 15.sp,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.delete),
              title: TextWidget(
                text: getLang(context, 'close_Account'),
                color: ColorManager.primary,
                textSize: 23.sp,
              ),
              subtitle: TextWidget(
                text: getLang(context, 'delete_your_account'),
                color: Colors.grey,
                textSize: 15.sp,
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
