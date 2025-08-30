import 'package:zone/core/widgets/header_image.dart';
import 'package:zone/spark/presentation/cubit/banners/banner_details/banner_details_cubit.dart';
import 'package:zone/spark/presentation/screens/offers/widgets/attatchment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/consts/text_styles.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/route_manager.dart';
import '../../../../core/managers/strings_assets_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/failure_widget.dart';
import '../../../data/models/home_utils_model.dart';
import '../home/widgets/home_slides.dart';

class OffersScreen extends StatelessWidget {
  final int bannerId;
  final int type;

  const OffersScreen({
    Key? key,
    required this.bannerId,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerDetailsCubit, BannerDetailsState>(
      builder: (context, state) {
        if (state is BannerDetailsLoadingState) {
          return Scaffold(
            body: showLoadingIndicator(),
          );
        }
        if (state is BannerDetailsErrorState) {
          body:
          Center(
            child: FailureWidget(
              message: state.message,
              onRetry: () {
                context
                    .read<BannerDetailsCubit>()
                    .getBannerDetails(bannerId, type);
              },
            ),
          );
        }
        if (state is BannerDetailsSuccessState) {
          final bannerDetails = state.bannerDetails;
          return Scaffold(
            backgroundColor: LightColors.white,
            appBar: HeaderWidget(
              titleFontSize: 20.sp,
              appBarHeight: 80.h,
              backgroundColor: LightColors.primary,
              title: bannerDetails.bannerEntity.title ?? '',
              isWithImage: true,
              serverImageLink: bannerDetails.bannerEntity.image ?? '',
              isBack: true,
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  HeaderImage(
                    serverImageLink: bannerDetails.bannerEntity.image ?? '',
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Text(
                      bannerDetails.bannerEntity.content ?? '',
                      style: AppTextStyle.white_18.copyWith(
                        color: LightColors.textColor.withOpacity(0.6),
                        height: 1.4,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    thickness: 0.5,
                    indent: 40.w,
                    endIndent: 40.w,
                    color: LightColors.black,
                  ),
                  SizedBox(height: 15.h),
                  if (bannerDetails.bannerEntity.url != null &&
                      (bannerDetails.bannerEntity.url?.isNotEmpty ?? false))
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: AttatchmentWidget(
                            title: bannerDetails.bannerEntity.url,
                            onTap: () =>
                                launch(bannerDetails.bannerEntity.url ?? ''),
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  if (bannerDetails.bannerEntity.url != null &&
                      (bannerDetails.bannerEntity.url?.isNotEmpty ?? false))
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: AttatchmentWidget(
                            onTap: () {
                              final Uri phoneUri = Uri(
                                scheme: 'tel',
                                path: bannerDetails.bannerEntity.phone ?? '',
                              );
                              launchUrl(phoneUri);
                            },
                            title: bannerDetails.bannerEntity.phone,
                            iconData: Icons.phone_in_talk_rounded,
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          StringsAssetsConstants.more,
                          style: AppTextStyle.black_18BOLD.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: MoreSlidesWidget(
                          getIdCallback: (int selectedBannerId) {
                            Navigator.of(context).pushReplacementNamed(
                              Routes.offers,
                              arguments: {
                                'id': selectedBannerId,
                                'type': type,
                              },
                            );
                          },
                          model: bannerDetails.bannersEntity
                              .map(
                                (banner) => HomeUtilsModel(
                                  title: banner.title,
                                  image: banner.image,
                                  id: banner.id,
                                ),
                              )
                              .toList(),
                          width: 0.33.sw,
                          height: 0.22.sh,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: FailureWidget(
              message: 'Unknown error occurred',
              onRetry: () {
                context.read<BannerDetailsCubit>().getBannerDetails(
                      bannerId,
                      type,
                    );
              },
            ),
          ),
        );
      },
    );
  }
}
