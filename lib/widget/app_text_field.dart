import 'package:chat/utils/padding_constants.dart';
import 'package:chat/utils/svg_constants.dart';
import 'package:chat/widget/svg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_theme.dart';
import '../utils/app_utils.dart';

typedef ValueSetter<T> = String? Function(T value);

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueSetter<String?>? validator;
  final EdgeInsets? padding, contentPadding, errorPadding;
  final TextStyle? style;
  final TextAlign textAlign = TextAlign.start;
  final bool? isPassword, error;
  final String? hint;
  final int? minLines, maxLines;
  final String? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final VoidCallback? onCLick;
  final TextStyle? hintStyle;
  final bool? isRequired, readOnly;
  final FocusNode? focus;
  final Color? color;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final bool? expands;
  final TextDirection direction;

  const AppTextField({
    super.key,
    this.controller,
    this.errorText,
    this.keyboardType,
    this.maxLength,
    this.onChanged,
    this.style,
    this.isPassword,
    this.hint,
    this.minLines,
    this.maxLines,
    this.suffixIcon,
    this.onSuffixPressed,
    this.onCLick,
    this.isRequired,
    this.readOnly,
    this.focus,
    this.color,
    this.hintStyle,
    this.error,
    this.padding,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
    this.expands,
    this.validator,
    this.obscureText,
    this.direction = TextDirection.ltr,
    this.contentPadding,
    this.errorPadding,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? PaddingConstants.paddingSymW20,
      child: Column(
        children: [
          TextFormField(
            textDirection: widget.direction,
            onTapOutside: (event) {
              AppUtils.keyboardClose();
            },
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: AppTheme.black,
            obscureText: widget.obscureText ?? false,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            validator: widget.validator,
            style: widget.style,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            focusNode: widget.focus,
            expands: widget.expands ?? false,
            textAlign: widget.textAlign,
            cursorErrorColor:
                widget.error ?? false ? AppTheme.red : AppTheme.black,
            decoration: InputDecoration(
              fillColor: widget.color ?? AppTheme.white,
              filled: true,
              focusedErrorBorder: widget.error ?? false
                  ? widget.focusedErrorBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide:
                            const BorderSide(width: 1.5, color: AppTheme.red),
                      )
                  : widget.focusedErrorBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide:
                            const BorderSide(width: 1.5, color: AppTheme.grey),
                      ),
              errorStyle: widget.error ?? false
                  ? AppUtils.textGreyPoppinsRegular13
                  : null,
              enabledBorder: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                        const BorderSide(width: 1.5, color: AppTheme.border),
                  ),
              errorBorder: widget.error ?? false
                  ? widget.focusedErrorBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide:
                            const BorderSide(width: 1.5, color: AppTheme.red),
                      )
                  : widget.focusedErrorBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide:
                            const BorderSide(width: 1.5, color: AppTheme.black),
                      ),
              focusedBorder: widget.focusedBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                        const BorderSide(width: 1.5, color: AppTheme.black),
                  ),
              hintStyle: widget.hintStyle,
              hintText: widget.hint,
              border: widget.border ?? InputBorder.none,
              isDense: true,
              contentPadding:
                  widget.contentPadding ?? PaddingConstants.paddingSymW20H12,
              suffixIcon: widget.suffixIcon != null
                  ? IconButton(
                      onPressed: widget.onSuffixPressed,
                      icon: SvgWidget(
                          svgPath: widget.suffixIcon ?? '',
                          width: 18.w,
                          height: 18.h),
                    )
                  : null,
            ),
          ),
          widget.error ?? false
              ? Padding(
                  padding: widget.errorPadding ?? PaddingConstants.zero,
                  child: Row(
                    children: [
                      // SvgWidget(
                      //   svgPath: SvgConstants.icRedInfoSvg(),
                      //   isPaddding: false,
                      //   height: 16.h,
                      // ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        widget.errorText ?? '',
                        style: AppUtils.textGreyPoppinsRegular13,
                      ),
                    ],
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }

  String? fun(String? i) {
    return "";
  }
// String get _errorText {
//   final text = widget.controller.value.text;
//   if (text.isEmpty) {
//     return widget.errorText ?? '';
//   }
//   return "";
// }
}
