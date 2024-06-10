import 'dart:async';
import 'package:ecommerce_project/presentation/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/verify_otp_controller.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/utility/snack_message.dart';
import 'package:ecommerce_project/presentation/widgets/app_logo.dart';
import 'package:ecommerce_project/presentation/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String email;

  const OtpVerifyScreen({super.key, required this.email});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final TextEditingController _otpTextController = TextEditingController();

  int countDown = 120;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppLogo(),
              const SizedBox(height: 16),
              Text('Enter Otp Code', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'A 6 Digit OTP Code Has Been Sent',
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              _buildPinField(),
              const SizedBox(height: 16),
              GetBuilder<VerifyOtpController>(builder: (verifyOtpController) {
                if (verifyOtpController.inProgress) {
                  return const ProgressIndicatorCircular();
                }
                return ElevatedButton(
                    onPressed: () async {
                      final result = await verifyOtpController.verifyOtp(
                          widget.email, _otpTextController.text);

                      if (result == true) {
                        Get.to(() => const CompleteProfileScreen());
                      } else {
                        if (mounted) {
                          showSnackMessage(
                              context, verifyOtpController.errorMessage);
                        }
                      }
                    },
                    child: const Text('Next'));
              }),
              const SizedBox(height: 30),
              buildRichText(),
              TextButton(
                  onPressed: () {
                    if (countDown == 0) {
                      countDown = 120;

                      _startTimer();
                    }
                  },
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                        color: countDown == 0 ? Colors.blue : Colors.grey),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  RichText buildRichText() {
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: AppColors.textColor),
            children: [
          const TextSpan(text: 'This code will expire in '),
          TextSpan(
              text: '$countDown' 's',
              style: const TextStyle(color: AppColors.primaryColor))
        ]));
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      controller: _otpTextController,
      appContext: context,
    );
  }

  void _startTimer() {
    const onStart = Duration(seconds: 1);
    Timer.periodic(onStart, (timer) {
      if (countDown == 0) {
        timer.cancel();

        setState(() {});
      } else {
        countDown--;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _otpTextController.dispose();
    super.dispose();
  }
}
