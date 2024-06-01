import 'package:ecommerce_project/presentation/screens/otp_verify_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/verify_email_controller.dart';
import 'package:ecommerce_project/presentation/utility/constants.dart';
import 'package:ecommerce_project/presentation/utility/snack_message.dart';
import 'package:ecommerce_project/presentation/widgets/app_logo.dart';
import 'package:ecommerce_project/presentation/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Spacer(),
                const AppLogo(),
                const SizedBox(height: 16),
                Text('Welcome Back', style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'Please Enter Your Email Address',
                  style: textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTextController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter an email';
                    }
                    if (Constants.emailRegex.hasMatch(value!) == false) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<VerifyEmailController>(
                    builder: (verifyEmailController) {
                  if (verifyEmailController.inProgress) {
                    return const ProgressIndicatorCircular();
                  }

                  return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          verifyEmailController
                              .verifyEmail(_emailTextController.text.trim())
                              .then((value) {
                            if (value == true) {
                              Get.to(() => OtpVerifyScreen(
                                  email: _emailTextController.text));
                            } else {
                              showSnackMessage(
                                  context, verifyEmailController.errorMessage);
                            }
                          });
                        }
                      },
                      child: const Text('Next'));
                }),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }
}
