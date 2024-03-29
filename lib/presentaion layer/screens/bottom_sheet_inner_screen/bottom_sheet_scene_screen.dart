import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../notification_services/localization/applocal.dart';
import '../../../shared/color_manager.dart';
import '../../../shared/components.dart';
import '../../widgets/text_widget.dart';

class BottomSheetAddSceneScreen extends StatelessWidget {
  BottomSheetAddSceneScreen({Key? key}) : super(key: key);
  var sceneNameController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: TextWidget(
          isTitle: true,
          text: getLang(context, 'new_scene'),
          color: ColorManager.primary,
          textSize: 20.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                buildTextFormField(
                  controller: sceneNameController,
                  inputType: TextInputType.text,
                  validate: (String? val) {
                    if (val!.isEmpty) {
                      return getLang(context, "please_enter_name");
                    }
                    return null;
                  },
                  label: getLang(context, "scene_name"),
                  prefixIcon: Icons.drive_file_rename_outline,
                  obscureText: false,
                ),
                SizedBox(height: 20.h),
                buildTextFormField(
                  controller: descriptionController,
                  inputType: TextInputType.text,
                  validate: (String? val) {
                    if (val!.isEmpty) {
                      return getLang(context, "please_enter_description");
                    }
                    return null;
                  },
                  label: getLang(context, "description"),
                  prefixIcon: Icons.description,
                  obscureText: false,
                ),
                SizedBox(height: 50.h),
                defaultButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //TODO
                    }
                  },
                  text: getLang(context, "save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
