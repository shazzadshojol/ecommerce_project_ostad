import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CartIncrementDecrement extends StatefulWidget {
  const CartIncrementDecrement({super.key});

  @override
  _CartIncrementDecrementState createState() => _CartIncrementDecrementState();
}

class _CartIncrementDecrementState extends State<CartIncrementDecrement> {
  int itemCount = 1;

  void incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItem() {
    setState(() {
      if (itemCount > 1) {
        itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAddOrRemove(
                icon: Icons.add,
                onPressed: () {
                  incrementItem();
                }),
            const SizedBox(width: 10),
            Text('$itemCount'),
            const SizedBox(width: 10),
            _buildAddOrRemove(
                icon: Icons.remove,
                onPressed: () {
                  decrementItem();
                }),
          ],
        ),
      ],
    );
  }

  Widget _buildAddOrRemove(
      {required final IconData icon, required final VoidCallback onPressed}) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: AppColors.primaryColor,
      ),
    );
  }
}
