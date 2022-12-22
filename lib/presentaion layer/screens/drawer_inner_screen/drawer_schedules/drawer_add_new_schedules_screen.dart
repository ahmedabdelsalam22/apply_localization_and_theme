import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinric_app/presentaion%20layer/widgets/text_widget.dart';
import 'package:sinric_app/shared/color_manager.dart';

import '../../../../shared/components.dart';

class DrawerAddNewSchedulesScreen extends StatelessWidget {
  DrawerAddNewSchedulesScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final deviceController = TextEditingController();
  final actionController = TextEditingController();
  final hourController = TextEditingController();
  final minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      appBar: AppBar(
        backgroundColor: ColorManager.backGround,
        elevation: 0.0,
        centerTitle: true,
        title: TextWidget(
          textSize: 20.sp,
          text: 'SCHEDULES',
          color: ColorManager.primary,
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: true,
                onChanged: (val) {},
              ),
              SizedBox(width: 2.w),
              TextWidget(
                text: 'Enable schedules',
                textSize: 18.sp,
                color: ColorManager.primary,
              ),
            ],
          ),
          buildTextFormField(
              controller: nameController,
              inputType: TextInputType.text,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'please_enter_name';
                }
                return null;
              },
              label: 'name',
              prefixIcon: Icons.drive_file_rename_outline,
              obscureText: false),
          SizedBox(height: 10.h),
          buildTextFormField(
              controller: descriptionController,
              inputType: TextInputType.text,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'please enter description';
                }
                return null;
              },
              label: "description",
              prefixIcon: Icons.description,
              obscureText: false),
          SizedBox(height: 10.h),
          buildTextFormField(
              controller: deviceController,
              inputType: TextInputType.text,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'please_enter_device';
                }
                return null;
              },
              label: 'device',
              prefixIcon: Icons.device_hub,
              obscureText: false),
          SizedBox(height: 10.h),
          buildTextFormField(
              controller: actionController,
              inputType: TextInputType.text,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'please_enter_action';
                }
                return null;
              },
              label: 'action',
              prefixIcon: Icons.account_tree,
              obscureText: false),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTextFormField(
                  controller: hourController,
                  inputType: TextInputType.datetime,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'please_enter_hours';
                    }
                    return null;
                  },
                  label: 'Hours',
                  prefixIcon: Icons.hourglass_bottom,
                  obscureText: false),
              SizedBox(height: 10.h),
              buildTextFormField(
                  controller: minuteController,
                  inputType: TextInputType.datetime,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'please_enter_minutes';
                    }
                    return null;
                  },
                  label: 'Minute',
                  prefixIcon: Icons.hourglass_bottom,
                  obscureText: false),
            ],
          ),
        ],
      ),
    );
  }
}
