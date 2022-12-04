import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinric_app/core/app_router/app_router.dart';
import 'package:sinric_app/presentaion%20layer/screens/register/register_cubit/register_cubit.dart';
import 'package:sinric_app/presentaion%20layer/screens/register/register_cubit/register_state.dart';

import '../../../core/components.dart';
import '../../../core/text_manager.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/google_button.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/RegisterScreen';

  RegisterScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: const BackWidget(),
            ),
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
                          TextManager.register,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(fontSize: 35.sp),
                        ),
                        SizedBox(height: 30.h),
                        buildTextFormField(
                            controller: nameController,
                            inputType: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid name';
                              }
                              return null;
                            },
                            label: TextManager.userName,
                            prefixIcon: Icons.person,
                            obscureText: false),
                        SizedBox(height: 15.h),
                        buildTextFormField(
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            label: TextManager.email,
                            prefixIcon: Icons.email_outlined,
                            obscureText: false),
                        SizedBox(height: 15.h),
                        buildTextFormField(
                            controller: phoneController,
                            inputType: TextInputType.number,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                            label: TextManager.phone,
                            prefixIcon: Icons.call,
                            obscureText: false),
                        SizedBox(height: 15.h),
                        buildTextFormField(
                          controller: passwordController,
                          inputType: TextInputType.visiblePassword,
                          obscureText: cubit.obscureText,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid password';
                            } else if (value.length < 6) {
                              return 'Password must be 6 characters';
                            } else {
                              return null;
                            }
                          },
                          label: TextManager.password,
                          prefixIcon: Icons.lock,
                          suffix: GestureDetector(
                            onTap: cubit.passwordSecure,
                            child: Icon(
                              cubit.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off_sharp,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0.h),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) {
                            return defaultButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    /// TODO:
                                  }
                                },
                                text: TextManager.register);
                          },
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              TextManager.iHaveAccount,
                            ),
                            defaultTextButton(
                                text: TextManager.login,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.loginScreenRoute);
                                }),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            '-or-',
                            style: TextStyle(color: Colors.black, fontSize: 18),
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
