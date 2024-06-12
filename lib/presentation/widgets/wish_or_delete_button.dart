import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class WishOrDeleteButton extends StatelessWidget {
  WishOrDeleteButton(
      {super.key,
      this.showAddToWishList = true,
      this.isSelected = false,
      required this.onTap});

  final bool showAddToWishList;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: showAddToWishList,
        replacement: _getIconButton(Icons.delete),
        child: InkWell(onTap: onTap, child: _getIconButton(getIconData())));
  }

  Widget _getIconButton(IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
        child: Icon(icon, color: AppColors.primaryColor, size: 16),
      ),
    );
  }

  IconData getIconData() {
    return isSelected ? Icons.favorite : Icons.favorite_border_rounded;
  }
}
