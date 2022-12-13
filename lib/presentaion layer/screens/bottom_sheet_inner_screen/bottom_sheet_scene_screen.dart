import 'package:flutter/material.dart';

import '../../../notification_services/localization/applocal.dart';
import '../../../shared/color_manager.dart';
import '../../../shared/components.dart';
import '../../widgets/text_widget.dart';

class BottomSheetAddSceneScreen extends StatelessWidget {
  BottomSheetAddSceneScreen({Key? key}) : super(key: key);
  var sceneNameController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.backGround,
        centerTitle: true,
        title: TextWidget(
          isTitle: true,
          text: getLang(context, 'new_scene'),
          color: ColorManager.primary,
          textSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 50),
              defaultButton(
                onPressed: () {
                  // TODO
                },
                text: getLang(context, "save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
