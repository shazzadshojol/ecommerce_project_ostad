import 'package:flutter/material.dart';

class ProgressIndicatorCircular extends StatelessWidget {
  const ProgressIndicatorCircular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
