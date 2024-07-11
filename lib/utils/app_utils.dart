import 'dart:io';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_theme.dart';

class AppUtils {
  //========================================================================================================================//

  // static String comaSeparate(num item) {
  //   var formatter = NumberFormat('#,##,000');
  //   return formatter.format(item);
  // }

  //========================================================================================================================//
  //Convert get format Size

  // static String getFileSizeString({required int bytes, int decimals = 0}) {
  //   const suffixes = ["b", "kb", "mb", "gb", "tb"];
  //   if (bytes == 0) return '0${suffixes[0]}';
  //   var i = (log(bytes) / log(1024)).floor();
  //   return ("${(bytes / pow(1024, 1)).toStringAsFixed(decimals)}");
  // }
  // ========================================================================================================================//

  // Poppins_REGULAR

  static TextStyle textblackPoppinsRegular13 = TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.black,
      fontWeight: FontWeight.w400,
      fontSize: 13.sp);
  static TextStyle textblackPoppinsRegular14 = TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.black,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp);
  static TextStyle textblackPoppinsRegular16 = TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.black,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp);

  static TextStyle textblackPoppinsRegular18 = TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.black,
      fontWeight: FontWeight.w400,
      fontSize: 18.sp);

  static TextStyle textGreyPoppinsRegular13 = TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.grey,
      fontWeight: FontWeight.w400,
      fontSize: 13.sp);

  // //========================================================================================================================//

  // //========================================================================================================================//
  // // Poppins_MEDIUM

  // static TextStyle textBlackOpacityPoppinsMedium11 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.blackOpacity,
  //     fontWeight: FontWeight.w500,
  //     fontSize: 11.sp);

  // //========================================================================================================================//
  //
  // // Poppins_SEMI_BOLD

  // static TextStyle textgreenPoppinsSemiBold10 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.green,
  //     fontWeight: FontWeight.w600,
  //     fontSize: 10.sp);
  // static TextStyle textprimaryPoppinsSemiBold10 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.primary,
  //     fontWeight: FontWeight.w600,
  //     fontSize: 10.sp);
  // static TextStyle textBlackOpacityPoppinsSemiBold10 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.blackOpacity,
  //     fontWeight: FontWeight.w600,height: 0.9,
  //     fontSize: 10.sp);
  //
  //
  // static TextStyle textWhitePoppinsSemiBold11 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.white,
  //     fontWeight: FontWeight.w600,
  //     fontSize: 11.sp);

  // //========================================================================================================================//
  //
  // // Poppins_BOLD

  // static TextStyle textlightPrimaryPoppinsBold11 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.lightPrimary,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 9.sp);
  // static TextStyle textBlackPoppinsBold9 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.black,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 9.sp);
  // static TextStyle textWhitePoppinsBold8 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.white,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 8.sp);
  // static TextStyle textgreenColorPoppinsBold9 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.greenColor,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 9.sp);
  // static TextStyle textWhitePoppinsBold11 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.white,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 9.sp);
  //
  // static TextStyle textredPoppinsBold9 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.red,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 9.sp);
  //
  // static TextStyle textBlackPoppinsBold10 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.black,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 10.sp);
  // static TextStyle textprimaryPoppinsBold10 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.primary,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 10.sp);
  // static TextStyle textgreenColorPoppinsBold10 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.greenColor,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 8.sp);
  //
  // static TextStyle textwhitePoppinsBold9 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.white,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 9.sp);

  // static TextStyle textWhitePoppinsBold36 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.white,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 36.sp);
  // static TextStyle textBlackPoppinsBold36 = TextStyle(
  //     fontFamily: "Poppins",
  //     color: AppTheme.black,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 36.sp);

  //========================================================================================================================//

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static keyboardClose() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

// static String phoneNumberFormat(String number) {
//   return number.replaceAllMapped(
//       RegExp(r'(\d{3})(\d{3})(\d+)'), (Match m) => "${m[1]}-${m[2]}-${m[3]}");
// }
//
// final numberFormatter = NumberFormat(
//   "##,##,###",
//   "HI", // local US
// );
//
// String priceNumberFormat(int number) {
//   return numberFormatter.format(number).toString();
// }
//
//
//
// static Widget svgImage(BuildContext context, String? image, bool isSelected) {
//   var res;
//
//   try {
//     res = SvgPicture.network(
//       image ?? '',
//       height: 26.w,
//       width: 26.w,
//       color: isSelected ? AppTheme.primary : AppTheme.diamondShapeColor,
//       placeholderBuilder: (context) {
//         return SizedBox();
//       },
//     );
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return res;
// }
}
