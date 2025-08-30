import 'package:zone/core/consts/constants.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/network_image_widget.dart';
import 'package:zone/spark/domain/entities/traks/traks_entity.dart';
import 'package:zone/spark/presentation/cubit/tracks/tracks_cubit.dart';
import 'package:zone/spark/presentation/cubit/tracks/tracks_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/consts/text_styles.dart';
import '../../../core/managers/route_manager.dart';
import '../../../core/widgets/ListView_shimmer_widget.dart';
import '../../../core/widgets/conditional_builder.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_list_tile_card.dart';
import '../../../core/widgets/failure_widget.dart';

class FollowingUpPage extends StatelessWidget {
  FollowingUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cubit = TracksCubit.get(context);
    return Scaffold(
      appBar: HeaderWidget(
        title: StringsAssetsConstants.tracking,
        titleFontSize: 20.sp,
        appBarHeight: 60.h,
        textColor: Colors.black,
        isWithImage: false,
        backgroundColor: Colors.transparent,
        backButtonBackgroundColor: Colors.black,
        isBack: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<TracksCubit>().getTracks();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0.h),
          child: BlocBuilder<TracksCubit, TracksState>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: state is TracksErrorState,
                builder: (context) => // error
                    Center(
                  child: Center(
                    child: FailureWidget(
                      message: (state as TracksErrorState).message,
                      onRetry: () {
                        cubit.getTracks();
                      },
                    ),
                  ),
                ),
                fallback: (context) => ConditionalBuilder(
                  condition: state is TracksLoadingState,
                  builder: (context) => const ListViewLoadingWidget(),
                  fallback: (context) => ConditionalBuilder(
                    condition: cubit.tracks.isEmpty,
                    builder: (context) => Expanded(
                      child: Center(
                        child: Text(
                          StringsAssetsConstants.no_training_classes,
                          style: AppTextStyle.black_18BOLD.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    fallback: (context) => ListView.separated(
                      itemCount: cubit.tracks.length,
                      itemBuilder: (context, index) {
                        TrackEntity? tracks = cubit.tracks[index];
                        return TracksItemWidget(
                          trackEntity: tracks,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 15.h,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TracksItemWidget extends StatelessWidget {
  const TracksItemWidget({
    super.key,
    required this.trackEntity,
  });

  final TrackEntity? trackEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomListTileCard(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.reports,
            arguments: {'id': trackEntity?.id ?? -1},
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
              imageLink: trackEntity?.image ?? '',
              onErrorWidget: kNetworkImageOnErrorWidget,
            ),
          ),
        ),
        title: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              trackEntity?.title ?? '',
              style: AppTextStyle.black_18BOLD.copyWith(
                fontSize: 20.sp,
                height: 0.7.h,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        subTitle: SizedBox(
          width: .36.sw,
          child: Text(
            (trackEntity?.shortContent ?? ''),
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: AppTextStyle.grey_15.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
        ),
        trailing: trackEntity?.newTitle != null &&
                (trackEntity?.newTitle?.isNotEmpty ?? false)
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
                  trackEntity?.newTitle ?? '-',
                  style: AppTextStyle.white_15BOLD,
                ),
              )
            : null,
      ),
    );
  }
}
