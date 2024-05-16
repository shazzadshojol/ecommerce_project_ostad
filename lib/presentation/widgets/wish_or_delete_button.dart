import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class WishOrDeleteButton extends StatelessWidget {
  const WishOrDeleteButton({super.key, this.showAddToWishList = true});

  final bool showAddToWishList;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: showAddToWishList,
        replacement: _getIconButton(Icons.delete),
        child: _getIconButton(Icons.favorite_outline));
  }

  Widget _getIconButton(IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
        child: Icon(icon, color: AppColors.primaryColor, size: 16),
      ),
    );
  }
}
