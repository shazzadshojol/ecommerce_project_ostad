import 'package:flutter/material.dart';

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
              SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _reviewTextController.dispose();
    super.dispose();
  }
}
