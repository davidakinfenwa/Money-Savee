import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const baseUrl = 'https://rickandmortyapi.com/api';
const initialPage = 1;

class ApiRequests {
  static const kRequestTimeout = 10; // seconds
}

class Endpoints {
  static const kCharacters = 'character';
}

class Sizing {
  static const kZeroValue = 0.0;
  static const kItemElevation = 1.0;
  static final kMaxItemHeight = 150.0.h;
  static const kMaxSubItemPadding = 30.0;
  static const kBorderRadius = 4.0;
  static const kItemBorderRadius = 10.0;
  static const kSizingMultiple = 8.0;
  static const kDebounceDuration = 500;
  static const kBottomSheet = 650.0;
  static const kScrollThreshold = 200;
  static const kProgressIndicatorSizeSmall = 20.0;
  static const kProgressIndicatorStrokeWidth = 2.0;
  static const kDashboardHeight = 200.0;
  static final kStackedDashboardHeight = 170.0.h;
  static const kStackedDashboardWidth = 320.0;

  // buttons
  static final kButtonHeight = 48.0.h;
  static final kButtonBorderWidth = 1.0.w;
  static const kButtonElevation = 2.0;
}

class CustomTypography {
  static const kHeadline5 = 20.0;
    static final kBackgroundColor = ColorUtil.colorFromHex('#FFf2f5fb');
    static final kDashboardColor = ColorUtil.colorFromHex('#FF368983');


  
}

class ColorUtil {
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
class ColorTheme {
  static const kPrimaryColor = Colors.blue;
  static const kIndicatorColor = Colors.green;
  static final kSecondaryColor = Colors.amber[800];
  static const kErrorColor = Colors.red;
  static const kGreyColor = Colors.grey;
  static final kGreyColorLight = Colors.grey.withOpacity(.40);
  static const kSubtitleTextColor = Colors.grey;
  static const kBlackColor = Colors.black;
  static const kBlackColor_54 = Colors.black54;

  static const kWhiteColor = Colors.white;
  static const kTransparentColor = Colors.transparent;
  static final kBackgroundColor = ColorUtil.colorFromHex('#FFf2f5fb');
  static final kDashboardColor = ColorUtil.colorFromHex('#FF368983');
}
