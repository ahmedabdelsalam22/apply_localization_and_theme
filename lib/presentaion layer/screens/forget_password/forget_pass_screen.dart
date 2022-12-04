import 'package:flutter/material.dart';

import '../../../core/app_router/app_router.dart';
import '../../../core/components.dart';
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
                    text: 'Forget Your Password?',
                    color: Colors.black,
                    textSize: 25,
                  ),
                  const SizedBox(height: 20),

                  /// TODO : handel this text ..
                  TextWidget(
                    text:
                        "               Don't worry enter your registered \n email to recieve password reset link in your inbox",
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
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      focusColor: Colors.deepOrange,
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange)),
                    ),
                  ),
                  Row(
                    children: [
                      const Text('I remembered password?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.loginScreenRoute);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
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
                      text: 'Send')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
