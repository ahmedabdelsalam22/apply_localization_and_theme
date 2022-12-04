import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinric_app/core/app_router/app_router.dart';
import 'package:sinric_app/presentaion%20layer/screens/login/login_cubit/login_cubit.dart';
import 'package:sinric_app/presentaion%20layer/screens/login/login_cubit/login_state.dart';

import '../../../core/components.dart';
import '../../../core/text_manager.dart';
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
      create: (context) => LoginCubit(),
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
                          'Welcome in Castle Black Tech',
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontSize: 15.sp,
                                  ),
                        ),
                        const SizedBox(height: 70),
                        Text(
                          'Login',
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
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            label: TextManager.email,
                            prefixIcon: Icons.email_outlined,
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
                            onTap: cubit.passWordSecure,
                            child: Icon(
                              cubit.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off_sharp,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text(
                              'I forget my password!',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.forgetPassScreenRoute);
                              },
                              child: const Text(
                                'reset',
                                style: TextStyle(color: Colors.deepOrange),
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
                                text: TextManager.login);
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
                              TextManager.iHaveNoAccount,
                            ),
                            defaultTextButton(
                                text: TextManager.register,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.registerScreenRoute);
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
