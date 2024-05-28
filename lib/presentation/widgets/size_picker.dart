import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker(
      {super.key,
      required this.sizes,
      required this.onChange,
      required this.isRounded});

  final List<String> sizes;
  final Function(String) onChange;
  final bool isRounded;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.sizes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedIndex = index;
                widget.onChange(widget.sizes[index]);
                setState(() {});
              },
              child: Container(
                  height: 30,
                  width: widget.isRounded ? 30 : null,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color:
                          _getSelectedBackgroundColor(index == selectedIndex),
                      borderRadius:
                          BorderRadius.circular(widget.isRounded ? 100 : 8),
                      border: Border.all(
                          color:
                              _getSelectedTextColor(index == selectedIndex))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FittedBox(
                      child: Text(
                        widget.sizes[index],
                        style: TextStyle(
                            color:
                                _getSelectedTextColor(index == selectedIndex)),
                      ),
                    ),
                  )),
            );
          }),
    );
  }

  Color _getSelectedTextColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.black;
  }

  Color _getSelectedBackgroundColor(bool isSelected) {
    return isSelected ? AppColors.primaryColor : Colors.transparent;
  }
}
