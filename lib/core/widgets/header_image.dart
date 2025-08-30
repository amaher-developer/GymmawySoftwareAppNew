import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/color_manager.dart';
import 'network_image_widget.dart';

class HeaderImage extends StatefulWidget {
  const HeaderImage({
    Key? key,
    this.serverImageLink,
    this.padding,
    this.imageFit,
    this.onTap,
  }) : super(key: key);
  final String? serverImageLink;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final BoxFit? imageFit;

  @override
  State<HeaderImage> createState() => _HeaderImageState();
}

class _HeaderImageState extends State<HeaderImage> {
  // final CarouselController _controller = CarouselController();
  final  CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            height: 80.h,
            width: 1.sw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: LightColors.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w),
            child: Container(
              height: 170.h,
              width: 1.sw,
              padding: widget.padding,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: LightColors.grey.withOpacity(0.5),
                  width: 0.5.w,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: NetworkImageWidget(
                  imageLink: widget.serverImageLink ?? '',
                  onErrorWidget: const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                  ),
                  height: 170.h,
                  width: 1.sw,
                  fit: widget.imageFit ?? BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
