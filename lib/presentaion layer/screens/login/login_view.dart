import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinric_app/presentaion%20layer/screens/login/login_cubit/login_cubit.dart';
import 'package:sinric_app/presentaion%20layer/screens/login/login_cubit/login_state.dart';

import '../../../notification_services/localization/applocal.dart';
import '../../../shared/app_router.dart';
import '../../../shared/color_manager.dart';
import '../../../shared/components.dart';
import '../../widgets/google_button.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/LoginScreen';

  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..setNotification(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getLang(context, "Welcome_in_Castle_Black_Tech"),
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontSize: 15.sp,
                                  ),
                        ),
                        const SizedBox(height: 70),
                        Text(
                          getLang(context, "login"),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(fontSize: 35.sp),
                        ),
                        SizedBox(height: 30.h),
                        buildTextFormField(
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return getLang(context, "Enter_a_valid_email");
                              }
                              return null;
                            },
                            label: getLang(context, "email"),
                            prefixIcon: Icons.email_outlined,
                            obscureText: false),
                        SizedBox(height: 15.h),
                        buildTextFormField(
                          controller: passwordController,
                          inputType: TextInputType.visiblePassword,
                          obscureText: cubit.obscureText,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return getLang(context, "Enter_a_valid_password");
                            } else if (value.length < 6) {
                              return getLang(
                                  context, "Password_must_be_6_characters");
                            } else {
                              return null;
                            }
                          },
                          label: getLang(context, "password"),
                          prefixIcon: Icons.lock,
                          suffix: GestureDetector(
                            onTap: cubit.passWordSecure,
                            child: Icon(
                              cubit.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off_sharp,
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              getLang(context, "I_forget_my_password!"),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.forgetPassScreenRoute);
                              },
                              child: Text(
                                getLang(context, "reset"),
                                style: TextStyle(
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0.h),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) {
                            return defaultButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    /// todo: that
                                  }
                                },
                                text: getLang(context, "login"));
                          },
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              getLang(context, "i_have_no_account"),
                            ),
                            defaultTextButton(
                                text: getLang(context, "register"),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.registerScreenRoute,
                                  );
                                }),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            getLang(context, "or"),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        const GoogleButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
