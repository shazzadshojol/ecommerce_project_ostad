import 'package:ecommerce_project/presentation/screens/home_screen.dart';
import 'package:ecommerce_project/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _mobileTextController = TextEditingController();
  final TextEditingController _cityTextController = TextEditingController();
  final TextEditingController _shippingTextController = TextEditingController();

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
              Text('Complete Profile', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Get Started With Us By Providing Your Details',
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 24),
              buildCompleteForm(),
              const Spacer(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildCompleteForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextField(
            controller: _firstNameTextController,
            decoration: const InputDecoration(hintText: 'First Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _lastNameTextController,
            decoration: const InputDecoration(hintText: 'Last Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _mobileTextController,
            decoration: const InputDecoration(hintText: 'Mobile No'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _cityTextController,
            decoration: const InputDecoration(hintText: 'City Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _shippingTextController,
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Shipping Address'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const HomeScreen());
              },
              child: const Text('Complete')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _mobileTextController.dispose();
    _cityTextController.dispose();
    _shippingTextController.dispose();
    super.dispose();
  }
}
