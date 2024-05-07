import 'package:ecommerce_project/presentation/screens/otp_verify_screen.dart';
import 'package:ecommerce_project/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
              TextField(
                controller: _emailTextController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() =>
                        OtpVerifyScreen(email: _emailTextController.text));
                  },
                  child: const Text('Next')),
              const Spacer(),
            ],
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
