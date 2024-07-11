import 'package:chat/config/app_theme.dart';
import 'package:chat/utils/app_height.dart';
import 'package:chat/utils/app_utils.dart';
import 'package:chat/utils/app_width.dart';
import 'package:chat/utils/padding_constants.dart';
import 'package:chat/widget/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.sky,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "asset/image/ic_background.png",
            width: AppWidth.width(context),
            height: AppHeight.height(context),
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 120.h,
            child: SizedBox(
              width: AppWidth.width(context),
              height: AppHeight.height(context),
              child: Column(
                children: [
                  Image.asset(
                    "asset/image/ic_avatar.png",
                    height: 80.h,
                    // width: AppWidth.width(context),
                    // height: AppHeight.height(context),
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                    child: Text(
                      "My name is Catherine. I like dancing in the rain and travelling all around the world.",
                      textAlign: TextAlign.center,
                      style: AppUtils.textGreyPoppinsRegular13,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: AppUtils.textblackPoppinsRegular13,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text("Register",
                          style: AppUtils.textblackPoppinsRegular13)
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Flexible(
                    child: Container(
                      padding: PaddingConstants.paddingAll20,
                      height: AppHeight.height(context),
                      width: AppWidth.width(context),
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.r),
                              topRight: Radius.circular(50.r))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email address",
                            style: AppUtils.textblackPoppinsRegular14,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          AppTextField(
                            hint: "Enter email address",
                            padding: PaddingConstants.zero,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Text(
                            "Password",
                            style: AppUtils.textblackPoppinsRegular14,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          AppTextField(
                            hint: "Enter password",
                            padding: PaddingConstants.zero,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
