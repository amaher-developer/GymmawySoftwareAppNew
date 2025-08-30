import 'dart:developer';

import 'package:zone/core/helper/user_helper.dart';
import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/core/utils/extensions.dart';
import 'package:zone/core/widgets/custom_appbar.dart';
import 'package:zone/core/widgets/rounder_container.dart';
import 'package:zone/spark/presentation/cubit/gallery/gallery_cubit.dart';
import 'package:zone/spark/presentation/cubit/home/home_cubit.dart';
import 'package:zone/spark/presentation/cubit/login/login_cubit.dart';
import 'package:zone/spark/presentation/cubit/profile/profile_cubit.dart';
import 'package:zone/spark/presentation/cubit/subscriptions/subscriptions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';
import '../../spark/presentation/cubit/shared/shared_cubit.dart';
import '../consts/text_styles.dart';
import '../enums/enums.dart';
import '../managers/asset_manager.dart';
import '../managers/route_manager.dart';
import '../managers/strings_assets_constants.dart';
import '../utils/utils.dart';
import 'custom_text_form_field.dart';
import 'outlined_button_widget.dart';

class LoginSparkWidget extends StatefulWidget {
  final bool fromLogin;
  final bool fromProfile;

  final bool? isFromTraining;
  final bool? isFromSubscription;
  final int id;

  LoginSparkWidget({
    Key? key,
    required this.fromLogin,
    this.isFromTraining,
    this.isFromSubscription,
    this.fromProfile = true,
    this.id = -1,
  }) : super(key: key);

  @override
  State<LoginSparkWidget> createState() => _LoginSparkWidgetState();
}

class _LoginSparkWidgetState extends State<LoginSparkWidget> {
  bool termsAndConditions = true;
  bool isSaved = true;
  bool isPassword = false;
  bool isSavedData = false;

  @override
  void initState() {
    LoginCubit.get(context).phoneController.text =
        UserHelper.getGuestData()?.name ?? '';
    LoginCubit.get(context).codeController.text =
        UserHelper.getGuestData()?.phone ?? '';
    isPassword = widget.fromLogin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
      previous.loginState != current.loginState,
      listener: (context, state) {
        if (state.loginState == RequestState.success) {
          Navigator.of(context).pushReplacementNamed(
            Routes.mainLayout,
          );
        } else if (state.loginState == RequestState.error &&
            state.isOtherError) {
          toggleSnackBar(
            context: context,
            content: state.loginMessage,
            status: NotificationStatus.error,
          );
        }
      },
      child: Scaffold(
        appBar: HeaderWidget(
          titleWidgetAlignment: MainAxisAlignment.end,
          titleWidget: RoundedContainer(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
            backgroundColor: LightColors.transparent,
            child: InkWell(
              onTap: () {
                print('currentLanguage $currentLanguage');
                if (currentLanguage == 'ar') {
                  SharedCubit.get(context).changlang(context, 'en');
                  HomeCubit.get(context).getHomeData();
                  SubscriptionsCubit.get(context).getSubscriptions();
                  GalleryCubit.get(context).getGalleryImages();
                } else {
                  SharedCubit.get(context).changlang(context, 'ar');
                  HomeCubit.get(context).getHomeData();
                  SubscriptionsCubit.get(context).getSubscriptions();
                  GalleryCubit.get(context).getGalleryImages();
                }
              },
              child: Row(
                children: [
                  Text(currentLanguage == 'ar' ? 'English' : 'العربية',
                      style: AppTextStyle.white_15.copyWith(
                          color: LightColors.primary,
                          fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.language,
                    color: LightColors.primary,
                    size: 25.sp,
                  ),
                ],
              ),
            ),
          ),
          titleFontSize: 20.sp,
          appBarHeight: 70.h,
          textColor: Colors.black,
          isWithImage: false,
          backgroundColor: Colors.transparent,
          backButtonBackgroundColor: LightColors.black,
          isBack: false,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                LogoManager.svgLogo,
                height: 0.25.sh,
              ),
              if (!widget.fromLogin && isSavedData)
                Padding(
                  padding: EdgeInsets.fromLTRB(0.1.sw, 20.r, 0.1.sw, 10.r),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.r, vertical: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color(0XFFF5F5F4),
                      ),
                      child: Row(children: [
                        const Icon(
                          Icons.check_circle,
                          color: LightColors.green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          StringsAssetsConstants.operation_done_successfully,
                          style: AppTextStyle.black_18,
                        ),
                      ])),
                ),
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) =>
                previous.loginState != current.loginState ||
                    previous.isPhoneValid != current.isPhoneValid ||
                    previous.loginMessage != current.loginMessage,
                builder: (context, state) {
                  return Column(
                    children: [
                      TextFieldWidget(
                        label: widget.fromLogin
                            ? StringsAssetsConstants.phone
                            : StringsAssetsConstants.name,
                        isLabelOutside: true,
                        textInputType: widget.fromLogin
                            ? TextInputType.phone
                            : TextInputType.name,
                        controller:
                        context.read<LoginCubit>().phoneController,
                        focusNode: context.read<LoginCubit>().phoneFocusNode,
                        enabled: state.loginState != RequestState.loading,
                        onChange: (value) {
                          context.read<LoginCubit>().changeLoginFormState();
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              context.read<LoginCubit>().codeFocusNode);
                        },
                        error:
                        !state.isPhoneValid ? state.loginMessage : null,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                        previous.loginState != current.loginState ||
                            previous.isCodeValid != current.isCodeValid ||
                            previous.loginMessage != current.loginMessage ||
                            previous.isLoginFormValid !=
                                current.isLoginFormValid,
                        builder: (context, innerState) {
                          return TextFieldWidget(
                            label: widget.fromLogin
                                ? StringsAssetsConstants.code
                                : StringsAssetsConstants.phone,
                            isLabelOutside: true,
                            obscureText: isPassword,
                            isPassword: isPassword,
                            textInputType: widget.fromLogin
                                ? TextInputType.number
                                : TextInputType.phone,
                            controller:
                            context.read<LoginCubit>().codeController,
                            focusNode:
                            context.read<LoginCubit>().codeFocusNode,
                            enabled: state.loginState != RequestState.loading,
                            onChange: (value) {
                              context
                                  .read<LoginCubit>()
                                  .changeLoginFormState();
                            },
                            onSubmitted: innerState.isLoginFormValid
                                ? (value) {
                              if (FocusScope.of(context)
                                  .hasPrimaryFocus) {
                                context.unFocus();
                              }
                              log('submitted');
                            }
                                : null,
                            error: !state.isCodeValid
                                ? state.loginMessage
                                : null,
                          );
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      if (!widget.fromLogin)
                        Padding(
                          padding:
                          EdgeInsets.fromLTRB(25.w, 0, 0.07.sw, 20.w),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: termsAndConditions,
                                  onChanged: (value) {
                                    setState(() {
                                      termsAndConditions = value!;
                                    });
                                    termsAndConditions = value!;
                                  },
                                  checkColor: Colors.black,
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.white),
                                  side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                        color: Colors.black, width: 1.5),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(Routes.termsAndConditions);
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: StringsAssetsConstants
                                              .do_you_agree_to,
                                          style: AppTextStyle.black_18,
                                        ),
                                        WidgetSpan(
                                          child: SizedBox(
                                            width: 5.w,
                                          ),
                                        ),
                                        TextSpan(
                                          text: StringsAssetsConstants
                                              .terms_and_condition,
                                          style: AppTextStyle.black_18
                                              .copyWith(
                                              color: LightColors.primary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      BlocSelector<LoginCubit, LoginState, RequestState?>(
                        selector: (state) {
                          return state.loginState;
                        },
                        builder: (context, state) {
                          if (state == RequestState.loading) {
                            return showLoadingIndicator();
                          }
                          return BlocSelector<LoginCubit, LoginState, bool>(
                            selector: (state) {
                              return state.isLoginFormValid;
                            },
                            builder: (context, isLoginFormValid) {
                              return OutlineButtonWidget(
                                color: Color(0XFFF97D04),
                                title: widget.fromLogin
                                    ? StringsAssetsConstants.login
                                    : StringsAssetsConstants.send,
                                textStyle: AppTextStyle.white_19,
                                onPressed: isLoginFormValid &&
                                    termsAndConditions
                                    ? () {
                                  context.unFocus();

                                  if (!widget.fromLogin) {
                                    UserHelper.setGuestData(
                                      guestData: {
                                        "name": context
                                            .read<LoginCubit>()
                                            .phoneController
                                            .text,
                                        "phone": context
                                            .read<LoginCubit>()
                                            .codeController
                                            .text
                                      },
                                    );
                                    setState(() {
                                      isSavedData = true;
                                    });
                                    if (widget.fromProfile) {
                                      Future.delayed(
                                          const Duration(
                                              milliseconds: 500), () {
                                        if (widget.isFromTraining ==
                                            true) {
                                          Navigator.of(context)
                                              .pop(true);
                                        } else if (widget
                                            .isFromSubscription ==
                                            true) {
                                          Navigator.of(context)
                                              .pop(true);
                                        }
                                      });
                                    }

                                    return;
                                  }
                                  UserHelper.clearGuestData();
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  context
                                      .read<LoginCubit>()
                                      .login()
                                      .then(
                                        (value) =>
                                        ProfileCubit.get(context)
                                            .getProfileData(),
                                  );
                                }
                                    : () {},
                                style:
                                !isLoginFormValid || !termsAndConditions
                                    ? Theme.of(context)
                                    .outlinedButtonTheme
                                    .style!
                                    .copyWith(
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                    LightColors.third,
                                  ),
                                )
                                    : null,
                              );
                            },
                          );
                        },
                      ),
                      if (widget.fromLogin)
                        Column(
                          children: [
                            SizedBox(
                              height: 12.h,
                            ),
                            OutlineButtonWidget(
                              style: Theme.of(context)
                                  .outlinedButtonTheme
                                  .style!
                                  .copyWith(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    LightColors.primary),
                              ),
                              textStyle: AppTextStyle.white_19,
                              title: StringsAssetsConstants.guest_login,
                              onPressed: () {
                                UserHelper.setIsGuest();
                                Navigator.of(context)
                                    .pushReplacementNamed(Routes.mainLayout);
                              },
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.termsAndConditions);
                              },
                              child: Text(
                                StringsAssetsConstants.terms_and_condition,
                                style: AppTextStyle.grey_18
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                    ],
                  );
                },
              ),
              if (!widget.fromLogin) ...[
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsAssetsConstants.already_have_account,
                        style: AppTextStyle.white_17.copyWith(
                          fontWeight: FontWeight.bold,
                          color: LightColors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () async {
                          await UserHelper.logout().then((value) {
                            setState(() {});
                            print(UserHelper.getGuestData()?.phone);
                            Navigator.of(context)
                                .pushNamed(Routes.initial);
                          });
                        },
                        child: Text(
                          StringsAssetsConstants.login,
                          style: AppTextStyle.white_17.copyWith(
                              fontWeight: FontWeight.bold,
                              color: LightColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
