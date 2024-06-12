import 'package:ecommerce_project/presentation/state_holders/cart_controllers/cart_list_controller.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/utility/image_path.dart';
import 'package:ecommerce_project/presentation/widgets/cart_increment_decrement.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_project/data/models/cart_models/cart_item-model.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  late int _counterValue;

  @override
  void initState() {
    super.initState();
    _counterValue = widget.cartItem.qty!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              ImagePath.footWere,
              width: 100,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.cartItem.product?.title}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Wrap(
                            children: [
                              Text(
                                'Color: ${widget.cartItem.color}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Size: ${widget.cartItem.size}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      )),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${widget.cartItem.product?.price ?? 0}'),
                    const CartIncrementDecrement(),
                    _buildCounter()
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return ItemCount(
      initialValue: _counterValue,
      minValue: 1,
      maxValue: 20,
      decimalPlaces: 0,
      color: AppColors.primaryColor,
      onChanged: (value) {
        _counterValue = value as int;
        setState(() {});
        Get.find<CartListController>()
            .changeProductQuantity(widget.cartItem.id!, _counterValue);
      },
    );
  }
}
