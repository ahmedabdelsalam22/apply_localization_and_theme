import 'package:flutter/material.dart';

import '../../../shared/app_router/app_router.dart';
import '../../../shared/applocal.dart';
import '../../../shared/components.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: const BackWidget(),
        backgroundColor: Colors.white,
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
                  const SizedBox(height: 10),
                  TextWidget(
                    text: getLang(context, "Forget_your_password"),
                    color: Colors.black,
                    textSize: 25,
                  ),
                  const SizedBox(height: 20),

                  /// TODO : handel this text ..
                  TextWidget(
                    text: getLang(
                        context, "Don't_worry_enter_your_registered_email"),
                    color: Colors.grey,
                    textSize: 16,
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/password.png',
                    height: 300,
                    width: 300,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return getLang(context, "Enter_a_valid_email");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.deepOrange,
                      labelText: getLang(context, "email"),
                      labelStyle: const TextStyle(color: Colors.deepOrange),
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: Colors.red,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(getLang(context, "I_remembered_password")),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.loginScreenRoute);
                        },
                        child: Text(
                          getLang(context, "login"),
                          style: const TextStyle(
                            color: Colors.deepOrange,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
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
