import 'package:ecommerce_project/data/models/review_models/add_review_model.dart';
import 'package:ecommerce_project/data/models/review_models/create_review_model.dart';
import 'package:ecommerce_project/presentation/screens/add_new_reviews_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/review_controllers/add_review_controller.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final CreateReviewModel createReviewModel = Get.put(CreateReviewModel());

  final AddReviewController addReviewController =
      Get.put(AddReviewController());

  @override
  void initState() {
    super.initState();
    addReviewController.getUserReview(AddReviewModel());
  }

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
              child: GetBuilder<AddReviewController>(
                  builder: (addReviewController) {
                if (addReviewController.inProgress) {
                  return const ProgressIndicatorCircular();
                }
                return ListView.builder(
                    itemCount:
                        addReviewController.addReviewModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final review =
                          addReviewController.addReviewModel?.data?[index];
                      return _buildReviewsCard(context, review);
                    });
              }),
            ),
            _buildAddReviews()
          ],
        ),
      ),
    );
  }

  Card _buildReviewsCard(BuildContext context, ReviewData? review) {
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
                    icon: const Icon(
                      Icons.person_2_rounded,
                      color: Colors.grey,
                    )),
                const SizedBox(width: 4),
                Text(
                  '${createReviewModel.firstName}'
                  '${createReviewModel.lastName}',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            const SizedBox(height: 10),
            Text('${review?.description}')
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${createReviewModel.rating ?? 0}',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
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
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
