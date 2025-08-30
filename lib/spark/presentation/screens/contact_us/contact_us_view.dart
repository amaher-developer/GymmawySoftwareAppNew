import 'dart:developer';

import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/utils/extensions.dart';
import 'package:zone/core/utils/utils.dart';
import 'package:zone/spark/presentation/cubit/contact/contact_cubit.dart';
import 'package:zone/spark/presentation/cubit/splash/splash_cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/consts/text_styles.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/header_image.dart';
import '../../../../core/widgets/outlined_button_widget.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactCubit, ContactState>(
      listenWhen: (previous, current) =>
          current is ContactErrorState || current is ContactSuccessState,
      listener: (context, state) {
        if (state is ContactSuccessState) {
          toggleSnackBar(
            context: context,
            content: StringsAssetsConstants.message_sent_successfully,
            status: NotificationStatus.success,
          );
        } else if (state is ContactErrorState) {
          toggleSnackBar(
            context: context,
            content: state.message,
            status: NotificationStatus.error,
          );
        }
      },
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          if (state is SplashLoadingState) {
            return Scaffold(body: showLoadingIndicator());
          }
          if (state is SplashSuccessState) {
            return Scaffold(
              appBar: HeaderWidget(
                title: StringsAssetsConstants.contact_us,
                titleFontSize: 20.sp,
                appBarHeight: 79.h,
                backgroundColor: LightColors.primary,
                isWithImage: true,
                isBack: true,
              ),
              body: SafeArea(
                child: ListView(
                  children: [
                    HeaderImage(
                      serverImageLink:
                          // google map image
                          state.splashEntity.mapLocationImage,
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                            state.splashEntity.mapLocationLink,
                          ),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Center(
                        child: Wrap(
                          children: [
                            InkWell(
                              onTap: () {
                                final Uri phoneUri = Uri(
                                  scheme: 'tel',
                                  path: state.splashEntity.phone ?? '',
                                );
                                launchUrl(phoneUri);
                              },
                              child: Text(
                                '${state.splashEntity.phone} ${state.splashEntity.supportEmail}',
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.ltr,
                                style: AppTextStyle.black_18BOLD.copyWith(
                                  fontSize: 20,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: _getPlaceName(
                          latitude: double.parse(state.splashEntity.latitude),
                          longitude:
                              double.parse(state.splashEntity.longitude)),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (state.splashEntity.facebook != null)
                            IconButton(
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    state.splashEntity.facebook!,
                                  ),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              icon: Image.asset(
                                'assets/icons/facebook.png',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          if (state.splashEntity.instagram != null) ...[
                            SizedBox(width: 10.w),
                            IconButton(
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    state.splashEntity.instagram!,
                                  ),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              icon: Image.asset(
                                'assets/icons/instagram.png',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ],
                          if (state.splashEntity.tiktok != null) ...[
                            SizedBox(width: 10.w),
                            IconButton(
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    state.splashEntity.tiktok!,
                                  ),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              icon: Image.asset(
                                'assets/icons/tiktok.png',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ],
                          if (state.splashEntity.snapchat != null) ...[
                            SizedBox(width: 10.w),
                            IconButton(
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    state.splashEntity.snapchat!,
                                  ),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              icon: Image.asset(
                                'assets/icons/snapchat.png',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ],
                          if (state.splashEntity.twitter != null) ...[
                            SizedBox(width: 10.w),
                            IconButton(
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    state.splashEntity.twitter!,
                                  ),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              icon: Image.asset(
                                'assets/icons/twitter.png',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    TextFieldWidget(
                      label: StringsAssetsConstants.phone,
                      controller: context.read<ContactCubit>().phoneController,
                      focusNode: context.read<ContactCubit>().phoneFocusNode,
                      onChange: (value) {
                        context.read<ContactCubit>().changeContactFormState();
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(
                            context.read<ContactCubit>().messageFocusNode);
                      },
                      isLabelOutside: true,
                      textInputType: TextInputType.number,
                    ),
                    BlocBuilder<ContactCubit, ContactState>(
                      buildWhen: (previous, current) =>
                          current is ContactFormValidState,
                      builder: (context, innerState) {
                        return TextFieldWidget(
                          label: StringsAssetsConstants.message,
                          controller:
                              context.read<ContactCubit>().messageController,
                          focusNode:
                              context.read<ContactCubit>().messageFocusNode,
                          onChange: (value) {
                            context
                                .read<ContactCubit>()
                                .changeContactFormState();
                          },
                          onSubmitted: innerState is ContactFormValidState
                              ? innerState.isContactFormValid
                                  ? (value) {
                                      if (FocusScope.of(context)
                                          .hasPrimaryFocus) {
                                        context.unFocus();
                                      }
                                      log('submitted');
                                      context
                                          .read<ContactCubit>()
                                          .sendMessage();
                                    }
                                  : null
                              : null,
                          isLabelOutside: true,
                          maxLines: 5,
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    //  Image.asset('assets/icons/map_new.png'),
                    BlocSelector<ContactCubit, ContactState, bool>(
                      selector: (state) {
                        return state is ContactLoadingState;
                      },
                      builder: (context, isLoadingState) {
                        if (isLoadingState) {
                          return showLoadingIndicator();
                        }
                        return BlocSelector<ContactCubit, ContactState, bool>(
                          selector: (state) =>
                              state is ContactFormValidState &&
                              state.isContactFormValid,
                          builder: (context, isContactFormValid) {
                            return OutlineButtonWidget(
                              title: StringsAssetsConstants.send,
                              color: LightColors.primary,
                              textStyle: AppTextStyle.white_22,
                              width: 0.8.sw,
                              height: 0.07.sh,
                              onPressed: isContactFormValid
                                  ? () {
                                      context.unFocus();

                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      context
                                          .read<ContactCubit>()
                                          .sendMessage();
                                    }
                                  : () {},
                              style: !isContactFormValid
                                  ? Theme.of(context)
                                      .outlinedButtonTheme
                                      .style!
                                      .copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.grey,
                                        ),
                                      )
                                  : null,
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Text(StringsAssetsConstants.unknown_error),
            ),
          );
        },
      ),
    );
  }
}

Future<String> placeFinder({
  required double latitude,
  required double longitude,
}) async {
  String placeName = '';
  try {
    List<Placemark> placeMarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    if (placeMarks.isNotEmpty) {
      Placemark placeMark = placeMarks.first;
      placeName =
          '${placeMark.country}, ${placeMark.administrativeArea}, ${placeMark.name}, ${placeMark.street}' ??
              '';
    } else {
      placeName = '-';
    }
  } catch (e) {
    //placeName = 'Error finding place';
    placeName = e.toString();
  }
  return placeName;
}

Widget _getPlaceName({
  required double latitude,
  required double longitude,
}) {
  return FutureBuilder<String>(
    future: placeFinder(latitude: latitude, longitude: longitude),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: showLoadingIndicator());
      } else if (snapshot.hasData) {
        return Center(
          child: Text(
            snapshot.data!,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: AppTextStyle.black_18BOLD.copyWith(
              fontSize: 19,
              color: LightColors.black.withOpacity(.8),
              height: 1.5,
            ),
          ),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text(
            '${StringsAssetsConstants.unknown_error}: ${snapshot.error}',
            textAlign: TextAlign.center,
            style: AppTextStyle.black_18BOLD.copyWith(
              fontSize: 19,
              color: LightColors.black.withOpacity(.8),
              height: 1.5,
            ),
          ),
        );
      } else {
        return Center(
          child: Text(
            StringsAssetsConstants.unknown_error,
            textAlign: TextAlign.center,
            style: AppTextStyle.black_18BOLD.copyWith(
              fontSize: 19,
              color: LightColors.black.withOpacity(.8),
              height: 1.5,
            ),
          ),
        );
      }
    },
  );
}
