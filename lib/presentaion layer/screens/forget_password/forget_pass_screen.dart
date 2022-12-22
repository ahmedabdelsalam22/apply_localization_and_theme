import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../notification_services/localization/applocal.dart';
import '../../../shared/app_router.dart';
import '../../../shared/color_manager.dart';
import '../../../shared/components.dart';
import '../../../shared/dark_theme_services/dark_theme_provider.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/text_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const BackWidget(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  TextWidget(
                    text: getLang(context, "Forget_your_password"),
                    color: isDark ? Colors.white : Colors.black,
                    textSize: 25.sp,
                  ),
                  SizedBox(height: 20.h),

                  /// TODO : handle this text ..
                  TextWidget(
                    text: getLang(
                        context, "Don't_worry_enter_your_registered_email"),
                    color: isDark ? Colors.white : Colors.grey,
                    textSize: 16.sp,
                  ),
                  SizedBox(height: 30.h),
                  Image.asset(
                    'assets/images/password.png',
                    height: 300.h,
                    width: 300.w,
                  ),
                  SizedBox(height: 30.h),
                  TextFormField(
                    cursorColor: ColorManager.primary,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return getLang(context, "Enter_a_valid_email");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: ColorManager.primary,
                      labelText: getLang(context, "email"),
                      labelStyle: TextStyle(
                        color: ColorManager.primary,
                      ),
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: ColorManager.primary,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: ColorManager.primary,
                      )),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        getLang(context, "I_remembered_password"),
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.loginScreenRoute);
                        },
                        child: Text(
                          getLang(context, "login"),
                          style: TextStyle(
                            color: ColorManager.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  defaultButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /// TODO:
                      }
                    },
                    text: getLang(context, "send"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
