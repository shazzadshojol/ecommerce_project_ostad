import 'package:ecommerce_project/data/models/category_data.dart';
import 'package:ecommerce_project/data/models/product_models.dart';
import 'package:ecommerce_project/presentation/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/new_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/popular_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/special_products_list_controller.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/utility/image_path.dart';
import 'package:ecommerce_project/presentation/widgets/category_items.dart';
import 'package:ecommerce_project/presentation/widgets/circular_indicator.dart';
import 'package:ecommerce_project/presentation/widgets/home_slider_banner.dart';
import 'package:ecommerce_project/presentation/widgets/product_card.dart';
import 'package:ecommerce_project/presentation/widgets/progress_indicator.dart';
import 'package:ecommerce_project/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return const CircularIndicator();
                }

                return HomeSliderBanner(
                  sliderList: sliderController.sliderList,
                );
              }),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'All Category',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().selectCategory();
                },
              ),
              const SizedBox(height: 8),
              GetBuilder<CategoryListController>(
                  builder: (categoryListController) {
                if (categoryListController.inProgress) {
                  return const SizedBox(
                    height: 120,
                    child: ProgressIndicatorCircular(),
                  );
                }

                return _buildCategoryListView(
                    categoryListController.categoryList);
              }),
              SectionHeader(
                title: 'Popular',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              GetBuilder<PopularProductsListController>(
                  builder: (popularProductsListController) {
                if (popularProductsListController.inProgress) {
                  return const SizedBox(
                    height: 320,
                    child: ProgressIndicatorCircular(),
                  );
                }

                return _buildProductListView(
                    popularProductsListController.popularProductList);
              }),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              GetBuilder<SpecialProductsListController>(
                  builder: (specialProductsListController) {
                if (specialProductsListController.inProgress) {
                  return const SizedBox(
                    height: 320,
                    child: ProgressIndicatorCircular(),
                  );
                }
                return _buildProductListView(
                    specialProductsListController.specialProductList);
              }),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              GetBuilder<NewProductsListController>(
                  builder: (newProductsListController) {
                if (newProductsListController.inProgress) {
                  return const SizedBox(
                    height: 320,
                    child: ProgressIndicatorCircular(),
                  );
                }
                return _buildProductListView(
                    newProductsListController.newProductList);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView(List<CategoryData> categoryList) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return CategoryItemsList(
              categoryData: categoryList[index],
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16);
          },
          itemCount: categoryList.length),
    );
  }

  Widget _buildProductListView(List<ProductModel> productList) {
    return SizedBox(
      height: 320,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ProductCard(
              product: productList[index],
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16);
          },
          itemCount: productList.length),
    );
  }

  TextField _buildSearchTextField() {
    return TextField(
      controller: _searchTextController,
      decoration: const InputDecoration(
          hintText: 'Search', prefixIcon: Icon(Icons.search)),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(ImagePath.logoNavSvg),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: AppColors.textColor,
                ),
                onPressed: () {
                  Get.to(() => const CompleteProfileScreen());
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(
                  Icons.call,
                  color: AppColors.textColor,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(
                  Icons.add_alert,
                  color: AppColors.textColor,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }
}
