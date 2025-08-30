import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:zone/spark/data/models/home_utils_model.dart';
import 'package:zone/spark/presentation/cubit/home/home_cubit.dart';
import 'package:zone/spark/presentation/screens/home/widgets/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/text_styles.dart';
import '../managers/color_manager.dart';
import '../managers/route_manager.dart';
import 'back_button_widget.dart';

class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  HeaderWidget({
    super.key,
    this.appBarHeight,
    this.isBack,
    this.title,
    this.actionWidget,
    this.isWithImage,
    this.serverImageLink,
    this.localImageLink,
    this.appBarTitlePadding,
    this.titleWidgetAlignment,
    this.titleWidget,
    this.textColor,
    this.backgroundColor,
    this.anotherWidget,
    this.backButtonBackgroundColor,
    this.banners = const [],
    this.titleFontSize,
    this.titleFontWeight,
    this.subTitle,
  });

  final double? appBarHeight;
  final String? serverImageLink;
  final String? localImageLink;
  final bool? isBack;
  final bool? isWithImage;
  final String? title;
  final String? subTitle;
  final Widget? titleWidget;
  final EdgeInsetsGeometry? appBarTitlePadding;
  final Widget? actionWidget;
  final MainAxisAlignment? titleWidgetAlignment;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? anotherWidget;
  final Color? backButtonBackgroundColor;
  final List<HomeUtilsModel>? banners;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(
        appBarHeight ?? (isWithImage == true ? 260.h : 70.h),
      );
}

class _HeaderWidgetState extends State<HeaderWidget> {
  // final CarouselController _carouselController = CarouselController();
  final  CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: widget.backgroundColor ?? LightColors.white,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.black.withAlpha(50),
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: widget.backgroundColor ?? LightColors.white,
          statusBarIconBrightness:
              widget.backgroundColor == Colors.transparent ||
                      widget.backgroundColor == Colors.white ||
                      widget.backgroundColor == LightColors.transparent ||
                      widget.backgroundColor == LightColors.white
                  ? Brightness.dark
                  : Brightness.light,
          statusBarBrightness: widget.backgroundColor == Colors.transparent ||
                  widget.backgroundColor == Colors.white ||
                  widget.backgroundColor == LightColors.transparent ||
                  widget.backgroundColor == LightColors.white
              ? Brightness.light
              : Brightness.dark

          // statusBarColor: widget.backgroundColor ?? LightColors.white,
          ),
      child: Container(
        color: widget.backgroundColor ?? LightColors.white,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: (widget.appBarHeight ?? 200),
                    padding: widget.appBarTitlePadding ??
                        EdgeInsetsDirectional.only(
                            start: 20.w, end: 15.w, top: 10),
                    decoration: BoxDecoration(
                      color: widget.backgroundColor ?? LightColors.primary,
                      /* borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.r),
                      ),*/
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: widget.titleWidgetAlignment ??
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.titleWidget ??
                                Text(
                                  ' ${widget.title}',
                                  maxLines: 1,
                                  style: AppTextStyle.white_18.copyWith(
                                    color: widget.textColor,
                                    fontWeight: widget.titleFontWeight ??
                                        FontWeight.w700,
                                    height: 1.5,
                                    fontSize: widget.titleFontSize ?? 18.sp,
                                  ),
                                ),
                            if (widget.subTitle != null)
                              SizedBox(
                                width: 290.w,
                                child: Text(
                                  ' ${widget.subTitle}',
                                  maxLines: 1,
                                  style: AppTextStyle.white_18.copyWith(
                                    color: widget.textColor,
                                    fontWeight: widget.titleFontWeight ??
                                        FontWeight.bold,
                                    height: 1.5,
                                    fontSize: widget.titleFontSize ?? 18.sp,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (widget.anotherWidget != null)
                          Row(
                            children: [
                              NotificationWidget(
                                backgroundColor:
                                    widget.backButtonBackgroundColor ??
                                        LightColors.lightGreen2,
                                iconSize: 45.r,
                                height: 60.h,
                                width: 60.w,
                                onPressed: () {
                                  HomeCubit.get(context)
                                      .changeHomeNotificationState();
                                  Navigator.pushNamed(
                                      context, Routes.notifications);
                                },
                                backIconColor:
                                    widget.backButtonBackgroundColor ==
                                            LightColors.white
                                        ? LightColors.black
                                        : null,
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        if (widget.isBack != false)
                          Row(
                            children: [
                              BackButtonWidget(
                                backgroundColor:
                                    widget.backButtonBackgroundColor ??
                                        LightColors.lightGreen2,
                                iconSize: 30.r,
                                height: 60.h,
                                width: 60.w,
                                backIconColor:
                                    widget.backButtonBackgroundColor ==
                                            LightColors.white
                                        ? LightColors.black
                                        : null,
                              ),
                              SizedBox(width: 5.w),
                            ],
                          ),
                        if (widget.isBack == false &&
                            widget.anotherWidget == null)
                          SizedBox(
                            width: 34.w,
                          ),
                        if (widget.actionWidget != null) widget.actionWidget!,
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
