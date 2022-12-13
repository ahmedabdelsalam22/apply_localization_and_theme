import 'package:flutter/material.dart';
import 'package:sinric_app/presentaion%20layer/widgets/text_widget.dart';

import '../../../notification_services/localization/applocal.dart';
import '../../../shared/color_manager.dart';
import '../../../shared/components.dart';

class BottomSheetAddRoomScreen extends StatelessWidget {
  BottomSheetAddRoomScreen({Key? key}) : super(key: key);

  var roomNameController = TextEditingController();
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
          text: getLang(context, 'new_room'),
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
              Row(
                children: [
                  TextWidget(
                    text: getLang(context, "home") + ': ',
                    color: ColorManager.primary,
                    textSize: 20,
                  ),
                  Expanded(
                    child: DropDownMenuComponent(
                      onChanged: (String? value) {},
                      hint: getLang(context, "home"),
                      items: [
                        getLang(context, "home"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildTextFormField(
                controller: roomNameController,
                inputType: TextInputType.text,
                validate: (String? val) {
                  if (val!.isEmpty) {
                    return getLang(context, "please_enter_name");
                  }
                  return null;
                },
                label: getLang(context, "room_name"),
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

class DropDownMenuComponent extends StatelessWidget {
  final void Function(String? value) onChanged;
  final List<String> items;
  final String hint;

  const DropDownMenuComponent({
    Key? key,
    required this.onChanged,
    required this.items,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration.collapsed(hintText: ''),
          value: null,
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          elevation: 16,
          style: Theme.of(context).textTheme.headline5,
          hint: FittedBox(
            child: Text(hint),
          ),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
