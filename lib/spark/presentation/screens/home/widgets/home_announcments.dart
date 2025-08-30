import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/managers/color_manager.dart';
import '../../../../../core/widgets/network_image_widget.dart';
import '../../../../data/models/home_utils_model.dart';

class HomeAnnouncements extends StatefulWidget {
  const HomeAnnouncements({
    Key? key,
    this.banners = const [],
    this.onTap,
  }) : super(key: key);
  final List<HomeUtilsModel>? banners;

  // create on tap function that take the banner id
  final Function(int, int)? onTap;

  @override
  State<HomeAnnouncements> createState() => _HomeAnnouncementsState();
}

class _HomeAnnouncementsState extends State<HomeAnnouncements> {
  int _current = 0;
  // final CarouselController _controller = CarouselController();
  final  CarouselSliderController _controller = CarouselSliderController();



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: LightColors.primary,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(80.r),
            ),
          ),
        ),
        Column(
          children: [
            CarouselSlider(
              items: [
                for (int i = 0; i < (widget.banners?.length ?? 0); i++) ...[
                  InkWell(
                    onTap: () => widget.onTap?.call(widget.banners?[i].id ?? 0,
                        widget.banners?[i].type ?? 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: NetworkImageWidget(
                        imageLink: widget.banners?[i].image ?? '',
                        onErrorWidget: const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        ),
                        width: 0.8.sw,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]
              ],
              options: CarouselOptions(
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                autoPlay: true,
                height: 160.h,
                viewportFraction: 0.9,
                disableCenter: true,
              ),
              carouselController: _controller,
            ),
            // Doted container
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.banners!.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 200),
                    width: 12.w,
                    height: 12.h,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 4.w,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? LightColors.primary
                            : Colors.grey.withOpacity(.3)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
