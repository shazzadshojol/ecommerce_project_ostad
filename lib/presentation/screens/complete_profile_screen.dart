import 'package:ecommerce_project/data/models/create_profile_data_model.dart';
import 'package:ecommerce_project/presentation/state_holders/auth_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/profile_controllers/create_profile_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/profile_controllers/read_profile_controller.dart';
import 'package:ecommerce_project/presentation/utility/snack_message.dart';
import 'package:ecommerce_project/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _cityTextController = TextEditingController();
  final TextEditingController _customerAddressTextController =
      TextEditingController();
  final TextEditingController _stateTextController = TextEditingController();
  final TextEditingController _postCodeTextController = TextEditingController();
  final TextEditingController _countryTextController = TextEditingController();
  final TextEditingController _faxTextController = TextEditingController();
  final TextEditingController _shippingAddressTextController =
      TextEditingController();
  final TextEditingController _shippingNameTextController =
      TextEditingController();
  final TextEditingController _shippingCityTextController =
      TextEditingController();
  final TextEditingController _shippingStateTextController =
      TextEditingController();
  final TextEditingController _shippingPostCodeTextController =
      TextEditingController();
  final TextEditingController _shippingCountryTextController =
      TextEditingController();
  final TextEditingController _shippingPhoneTextController =
      TextEditingController();

  final CreateProfileController profileController =
      Get.put(CreateProfileController());

  final ReadProfileController readProfileController =
      Get.put(ReadProfileController());

  @override
  void initState() {
    super.initState();
    _loadProfileData();

  }

  Future<void> _loadProfileData() async {
    await readProfileController.showUserDetails();
    CreateProfileModel? profileData =
        await AuthController.getUserData(CreateProfileModel());
    // CreateProfileModel? profileData = readProfileController.profileData.value;

    if (profileData != null) {
      _nameTextController.text = profileData.cusName ?? '';
      _customerAddressTextController.text = profileData.cusAdd ?? '';
      _cityTextController.text = profileData.cusCity ?? '';
      _stateTextController.text = profileData.cusState ?? '';
      _postCodeTextController.text = profileData.cusPostcode ?? '';
      _countryTextController.text = profileData.cusCountry ?? '';
      _phoneTextController.text = profileData.cusPhone ?? '';
      _faxTextController.text = profileData.cusFax ?? '';
      _shippingNameTextController.text = profileData.shipName ?? '';
      _shippingAddressTextController.text = profileData.shipAdd ?? '';
      _shippingCityTextController.text = profileData.shipCity ?? '';
      _shippingStateTextController.text = profileData.shipState ?? '';
      _shippingPostCodeTextController.text = profileData.shipPostcode ?? '';
      _shippingCountryTextController.text = profileData.shipCountry ?? '';
      _shippingPhoneTextController.text = profileData.shipPhone ?? '';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                  ],
                ),
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
          TextFormField(
            controller: _nameTextController,
            decoration: const InputDecoration(hintText: 'Full Name'),
            // validator: (value) => textValidator(value, 'Enter Full Name'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _customerAddressTextController,
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Customer Address'),
            // validator: (value) =>
            //     textValidator(value, 'Enter Customer Address'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _cityTextController,
            decoration: const InputDecoration(hintText: 'City'),
            // validator: (value) => textValidator(value, 'Enter City Name'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _stateTextController,
            decoration: const InputDecoration(hintText: 'State'),
            // validator: (value) => textValidator(value, 'Enter State Name'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _postCodeTextController,
            decoration: const InputDecoration(hintText: 'Postcode'),
            // validator: (value) => textValidator(value, 'Enter Postcode'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _countryTextController,
            decoration: const InputDecoration(hintText: 'Country'),
            // validator: (value) => textValidator(value, 'Enter Country Name'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _phoneTextController,
            decoration: const InputDecoration(hintText: 'Phone No'),
            // validator: (value) => textValidator(value, 'Enter Phone No'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _faxTextController,
            decoration: const InputDecoration(hintText: 'Fax No'),
            // validator: (value) => textValidator(value, 'Enter Fax No'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _shippingNameTextController,
            decoration: const InputDecoration(hintText: 'Shipping Name'),
            // validator: (value) => textValidator(value, 'Enter Shipping Name'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _shippingAddressTextController,
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Shipping Address'),
            // validator: (value) =>
            //     textValidator(value, 'Enter Shipping Address'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _shippingCityTextController,
            decoration: const InputDecoration(hintText: 'Shipping City'),
            // validator: (value) => textValidator(value, 'Enter Shipping City'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _shippingStateTextController,
            decoration: const InputDecoration(hintText: 'Shipping State'),
            // validator: (value) => textValidator(value, 'Enter Shipping State'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _shippingPostCodeTextController,
            decoration: const InputDecoration(hintText: 'Shipping Postcode'),
            // validator: (value) =>
            //     textValidator(value, 'Enter Shipping Postcode'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _shippingCountryTextController,
            decoration: const InputDecoration(hintText: 'Shipping Country'),
            // validator: (value) =>
            //     textValidator(value, 'Enter Shipping Country'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _shippingPhoneTextController,
            decoration: const InputDecoration(hintText: 'Shipping Phone No'),
            // validator: (value) =>
            //     textValidator(value, 'Enter Shipping Phone No'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              try {
                if (_formKey.currentState?.validate() ?? false) {
                  CreateProfileModel profileModel = CreateProfileModel(
                    cusName: _nameTextController.text.trim(),
                    cusAdd: _customerAddressTextController.text.trim(),
                    cusCity: _cityTextController.text.trim(),
                    cusState: _stateTextController.text.trim(),
                    cusPostcode: _postCodeTextController.text.trim(),
                    cusCountry: _countryTextController.text.trim(),
                    cusPhone: _phoneTextController.text.trim(),
                    cusFax: _faxTextController.text.trim(),
                    shipName: _shippingNameTextController.text.trim(),
                    shipAdd: _shippingAddressTextController.text.trim(),
                    shipCity: _shippingCityTextController.text.trim(),
                    shipState: _shippingStateTextController.text.trim(),
                    shipPostcode: _shippingPostCodeTextController.text.trim(),
                    shipCountry: _shippingCountryTextController.text.trim(),
                    shipPhone: _shippingPhoneTextController.text.trim(),
                  );

                  bool result =
                      await profileController.saveUserDetails(profileModel);

                  if (result) {
                    // Get.to(() => const MainBottomNavScreen());
                    if(mounted){Navigator.pop(context);}
                  } else {
                    {
                      if (mounted) {
                        showSnackMessage(
                            context, profileController.errorMessage);
                      }
                    }
                  }
                }
              } catch (e) {
                e.toString();
              }
            },
            child: const Text('Complete'),
          )
        ],
      ),
    );
  }

  // String? textValidator(String? value, String msg) {
  //   if (value?.trim().isEmpty ?? true) {
  //     return msg;
  //   }
  //   return null;
  // }

  @override
  void dispose() {
    _nameTextController.dispose();
    _addressTextController.dispose();
    _phoneTextController.dispose();
    _cityTextController.dispose();
    _customerAddressTextController.dispose();
    _stateTextController.dispose();
    _postCodeTextController.dispose();
    _countryTextController.dispose();
    _faxTextController.dispose();
    _shippingAddressTextController.dispose();
    _shippingNameTextController.dispose();
    _shippingCityTextController.dispose();
    _shippingStateTextController.dispose();
    _shippingPostCodeTextController.dispose();
    // _shippingPostCodeTextController.dispose();
    _shippingPhoneTextController.dispose();
    super.dispose();
  }
}
