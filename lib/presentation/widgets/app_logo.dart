import 'package:ecommerce_project/presentation/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImagePath.logoSvg,
      width: 100,
    );
  }
}
