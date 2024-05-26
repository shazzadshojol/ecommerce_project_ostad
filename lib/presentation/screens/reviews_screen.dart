import 'package:ecommerce_project/presentation/screens/add_new_reviews_screen.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildReviewsCard(context);
                  }),
            ),
            _buildAddReviews()
          ],
        ),
      ),
    );
  }

  Card _buildReviewsCard(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person_2_rounded,
                      color: Colors.grey,
                    )),
                SizedBox(width: 4),
                Text(
                  'Rabbil Hasan',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
                '''Step into unparalleled comfort and style with the UltraComfort Running Shoes. Designed for athletes and casual runners alike, these shoes are the perfect blend of functionality and fashion. Whether you're hitting the track or running errands, UltraComfort ensures every step is a pleasure.''')
          ],
        ),
      ),
    );
  }

  Widget _buildAddReviews() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reviews (1000)',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.textColor),
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: () {
              Get.to(() => const AddNewReviewsScreen());
            },
            backgroundColor: AppColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
