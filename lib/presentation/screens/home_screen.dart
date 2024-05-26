import 'package:ecommerce_project/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_project/presentation/utility/image_path.dart';
import 'package:ecommerce_project/presentation/widgets/category_items.dart';
import 'package:ecommerce_project/presentation/widgets/circular_icon_button.dart';
import 'package:ecommerce_project/presentation/widgets/circular_indicator.dart';
import 'package:ecommerce_project/presentation/widgets/home_slider_banner.dart';
import 'package:ecommerce_project/presentation/widgets/prodect_card.dart';
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
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 8),
              _buildCategoryListView(),
              SectionHeader(
                title: 'Popular',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              _buildProductListView(),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              _buildProductListView(),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              _buildProductListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return const CategoryItemsList();
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16);
          },
          itemCount: 8),
    );
  }

  Widget _buildProductListView() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return const ProductCard();
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16);
          },
          itemCount: 8),
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
              CircularIconButton(
                icon: Icons.person,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              CircularIconButton(
                icon: Icons.call,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              CircularIconButton(
                icon: Icons.notifications,
                onTap: () {},
              )
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
