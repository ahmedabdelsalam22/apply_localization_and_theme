import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
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
                style: TextStyle(fontSize: 20.sp),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
