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

bool isLogin = false;

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "asset/image/ic_background.png",
              width: AppWidth.width(context),
              height: 220.h,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.only(top: 155.h),
              height: AppHeight.height(context) - 155.h,
              width: AppWidth.width(context),
              decoration: BoxDecoration(
                  color: AppTheme.sky,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r))),
            ),
            SizedBox(
              width: AppWidth.width(context),
              height: AppHeight.height(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: PaddingConstants.paddingSymW20,
                    child: Text(
                      "Hi, Welcome!",
                      style: AppUtils.textwhiteSFProBold40,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Image.asset(
                      "asset/image/ic_avatar.png",
                      height: 80.h,
                      // width: AppWidth.width(context),
                      // height: AppHeight.height(context),
                      fit: BoxFit.fill,
                    ),
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: AppUtils.textblackPoppinsRegular13,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              height: 5.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: isLogin
                                      ? AppTheme.grey
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Register",
                              style: AppUtils.textblackPoppinsRegular13,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              height: 5.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: !isLogin
                                      ? AppTheme.grey
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r)),
                            )
                          ],
                        ),
                      ),
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
                          boxShadow: [
                            BoxShadow(color: AppTheme.shadow, blurRadius: 20.r)
                          ],
                          color: AppTheme.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.r),
                              topRight: Radius.circular(50.r))),
                      child: isLogin
                          ? Column(
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
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: AppWidth.width(context),
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
                                      color: AppTheme.blue),
                                  child: Text(
                                    "Login",
                                    style: AppUtils.textwhiteSFProSemiBold16,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isLogin = false;
                                    });
                                  },
                                  child: Center(
                                    child: RichText(
                                      overflow: TextOverflow.clip,
                                      textDirection: TextDirection.rtl,
                                      softWrap: true,
                                      maxLines: 1,
                                      text: TextSpan(
                                        text: 'Don’t have an account?',
                                        style: AppUtils.textblackSFProRegular14,
                                        children: <TextSpan>[
                                          TextSpan(text: "   "),
                                          TextSpan(
                                              text: "Sign up",
                                              style: AppUtils
                                                  .textblueSFProRegular14),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
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
                                  "Create a Password",
                                  style: AppUtils.textblackPoppinsRegular14,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                AppTextField(
                                  hint: "must be 8 characters",
                                  padding: PaddingConstants.zero,
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  "Confirm password",
                                  style: AppUtils.textblackPoppinsRegular14,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                AppTextField(
                                  hint: "repeat password",
                                  padding: PaddingConstants.zero,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: AppWidth.width(context),
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
                                      color: AppTheme.blue),
                                  child: Text(
                                    "Sign Up",
                                    style: AppUtils.textwhiteSFProSemiBold16,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isLogin = true;
                                    });
                                  },
                                  child: Center(
                                    child: RichText(
                                      overflow: TextOverflow.clip,
                                      textDirection: TextDirection.rtl,
                                      softWrap: true,
                                      maxLines: 1,
                                      text: TextSpan(
                                        text: 'Already have an account?',
                                        style: AppUtils.textblackSFProRegular14,
                                        children: <TextSpan>[
                                          TextSpan(text: "   "),
                                          TextSpan(
                                              text: "Log in",
                                              style: AppUtils
                                                  .textblueSFProRegular14),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
