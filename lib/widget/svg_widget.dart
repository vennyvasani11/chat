import 'package:chat/utils/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  final String svgPath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final VoidCallback? onTap;
  final bool? isPaddding;

  const SvgWidget(
      {super.key,
      required this.svgPath,
      this.height,
      this.width,
      this.color,
      this.fit,
      this.onTap,
      this.isPaddding = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.r),
      onTap: onTap,
      child: Padding(
        padding: isPaddding ?? false ? EdgeInsets.all(6.h) : EdgeInsets.zero,
        child: SvgPicture.asset(
          // fit: fit ?? BoxFit.contain,
          (SvgConstantsPath.svgPath() + svgPath ?? '') ?? '',
          height: height ?? 24.w,
          width: width ?? 24.w,
          color: color,
        ),
      ),
    );
  }
}
