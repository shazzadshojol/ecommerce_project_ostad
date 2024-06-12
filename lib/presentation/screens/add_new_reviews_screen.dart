import 'package:ecommerce_project/data/models/review_models/create_review_model.dart';
import 'package:ecommerce_project/presentation/state_holders/review_controllers/create_review_controller.dart';
import 'package:ecommerce_project/presentation/utility/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewReviewsScreen extends StatefulWidget {
  const AddNewReviewsScreen({super.key});

  @override
  State<AddNewReviewsScreen> createState() => _AddNewReviewsScreenState();
}

class _AddNewReviewsScreenState extends State<AddNewReviewsScreen> {
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _reviewTextController = TextEditingController();
  final CreateReviewController createReviewController =
      Get.put(CreateReviewController());
  final CreateReviewModel createReviewModel = CreateReviewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Write Review',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
                maxLines: 50,
                minLines: 10,
                controller: _reviewTextController,
                decoration: const InputDecoration(hintText: 'Write Review'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    _addReview();
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  void _addReview() async {
    print('Submit button tapped');
    createReviewModel.firstName = _firstNameTextController.text.trim();
    createReviewModel.lastName = _lastNameTextController.text.trim();
    createReviewModel.description = _reviewTextController.text.trim();

    bool result =
        await createReviewController.saveUserReview(createReviewModel);

    print("Review Model: ${createReviewModel.toJson()}");

    if (result) {
      Get.back();
    } else {
      if (mounted) {
        showSnackMessage(context, 'Review adding failed');
      }
    }
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _reviewTextController.dispose();
    super.dispose();
  }
}
