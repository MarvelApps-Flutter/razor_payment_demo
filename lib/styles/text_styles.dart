import 'package:flutter/material.dart';
import 'package:flutter_razorpay_demo/constants/app_constants.dart';

class AppTextStyles {
  static const popularMoviesTextStyle = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w700,
      fontSize: 25,
      fontFamily: AppConstants.rubikTextStyleString);

  static const nameTextStyle = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w600, fontFamily: AppConstants.rubikTextStyleString);

  static const headingTextStyle = TextStyle(
    color: Colors.black54,
    fontFamily: AppConstants.neueHassDisplayTextStyleString,
    fontSize: 16.0,
  );

  static const headingBelowTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.nunitoSansTextStyleString,
  );

  static const simpleTextStyle =
  TextStyle(color: Colors.black54, fontFamily: AppConstants.neueHassDisplayTextStyleString);
}
