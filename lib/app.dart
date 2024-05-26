import 'dart:ui';

import 'package:ecommerce_project/controller_binder.dart';
import 'package:ecommerce_project/presentation/screens/splash_screen.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      home: const SplashScreen(),
      theme: ThemeData(
          colorSchemeSeed: AppColors.primaryColor,
          textTheme: _buildTextTheme(),
          inputDecorationTheme: _inputDecorationTheme(),
          elevatedButtonTheme: buildElevatedButtonThemeData(),
          appBarTheme: _buildAppBarTheme(),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor))),
    );
  }

  AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
        backgroundColor: Colors.white, foregroundColor: Colors.black87);
  }

  ElevatedButtonThemeData buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.maxFinite, 55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white),
    );
  }

  TextTheme _buildTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24,
          color: AppColors.textColor,
          fontWeight: FontWeight.w600),
      titleMedium: TextStyle(
          fontSize: 18,
          color: AppColors.textColor,
          fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          fontSize: 16,
          color: AppColors.textColor,
          fontWeight: FontWeight.w400),
    );
  }

  InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
      hintStyle:
          const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
      border: _outlineInputBorder,
      enabledBorder: _outlineInputBorder,
      focusedBorder: _outlineInputBorder,
      errorBorder: _outlineInputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16));

  final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(8));
}
