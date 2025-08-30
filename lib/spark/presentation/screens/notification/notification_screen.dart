import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/network_image_widget.dart';
import 'package:zone/spark/presentation/cubit/banners/all_banners/banners_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/consts/constants.dart';
import '../../../../core/consts/text_styles.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/route_manager.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_list_tile_card.dart';
import '../../../../core/widgets/failure_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        appBarTitlePadding:
            EdgeInsetsDirectional.only(start: 22.w, end: 18.w, top: 10),
        title: StringsAssetsConstants.notifications,
        textColor: LightColors.black,
        backButtonBackgroundColor: LightColors.black,
        appBarHeight: 79.h,
        titleFontSize: 20.sp,
        backgroundColor: LightColors.transparent,
        isWithImage: true,
        isBack: true,
      ),
      body: BlocBuilder<BannersCubit, BannersState>(
        builder: (context, state) {
          if (state is BannersLoadingState) {
            return showLoadingIndicator();
          }
          if (state is BannersErrorState) {
            return Center(
              child: FailureWidget(
                message: state.message,
                onRetry: () {
                  context.read<BannersCubit>().getAllBanners();
                },
              ),
            );
          }
          if (state is BannersSuccessState) {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<BannersCubit>().getAllBanners();
                },
                child: ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
                  itemCount: state.banners.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: CustomListTileCard(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.offers,
                            arguments: {
                              'id': state.banners[index].id,
                              'type': state.banners[index].type,
                            },
                          );
                        },
                        leading: Container(
                          height: .1.sh,
                          width: .19.sw,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0XFFEAEAEA),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            child: NetworkImageWidget(
                              imageLink: state.banners[index].image ?? '',
                              onErrorWidget: kNetworkImageOnErrorWidget,
                            ),
                          ),
                        ),
                        title: Text(
                          state.banners[index].date ?? '',
                          style: AppTextStyle.black_18BOLD.copyWith(
                            fontSize: 20.sp,
                            height: 0.7.h,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        subTitle: SizedBox(
                          width: .36.sw,
                          child: Text(
                            state.banners[index].title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: AppTextStyle.grey_15.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                          ),
                        ),
                        trailing: state.banners[index].newTitle != null &&
                                (state.banners[index].newTitle?.isNotEmpty ??
                                    false)
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0XFFF97D04),
                                  borderRadius: BorderRadius.circular(
                                    25.r,
                                  ),
                                ),
                                child: Text(
                                  state.banners[index].newTitle ?? '-',
                                  style: AppTextStyle.white_15BOLD,
                                ),
                              )
                            : null,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 15.h,
                  ),
                ),
              ),
            );
          }
          return Center(
            child: FailureWidget(
              message: 'Unknown error occurred',
              onRetry: () {
                context.read<BannersCubit>().getAllBanners();
              },
            ),
          );
        },
      ),
    );
  }
}
