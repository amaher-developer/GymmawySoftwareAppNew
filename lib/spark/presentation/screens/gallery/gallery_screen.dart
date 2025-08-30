import 'package:zone/core/widgets/conditional_builder.dart';
import 'package:zone/core/widgets/network_image_widget.dart';
import 'package:zone/spark/presentation/cubit/gallery/gallery_cubit.dart';
import 'package:zone/spark/presentation/cubit/gallery/gallery_state.dart';
import 'package:zone/spark/presentation/screens/gallery/photo_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/consts/constants.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/strings_assets_constants.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/failure_widget.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = GalleryCubit.get(context);
        print(cubit.galleryList);
        if (state is LoadingGalleryStates) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessGalleryStates) {
          print(state.gallery);
        }
        return Scaffold(
          backgroundColor: LightColors.white,
          appBar: HeaderWidget(
            title: StringsAssetsConstants.gallery,
            titleFontSize: 20.sp,
            appBarHeight: 60.h,
            titleFontWeight: FontWeight.bold,
            textColor: Colors.black,
            isWithImage: false,
            backgroundColor: Colors.transparent,
            backButtonBackgroundColor: LightColors.black,
            isBack: false,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ConditionalBuilder(
                  condition: state is LoadingGalleryStates,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fallback: (context) => ConditionalBuilder(
                    condition: state is ErrorGalleryStates,
                    builder: (context) => Center(
                      child: FailureWidget(
                        message: 'لا يوجد اتصال بالانترنت',
                        onRetry: () {
                          cubit.getGalleryImages();
                        },
                      ),
                    ),
                    fallback: (context) => RefreshIndicator(
                      onRefresh: () async {
                        cubit.getGalleryImages();
                      },
                      child: GridView.custom(
                        padding: EdgeInsets.all(12.r),
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.h,
                          crossAxisSpacing: 15.w,
                          repeatPattern: QuiltedGridRepeatPattern.same,
                          pattern: [
                            const QuiltedGridTile(1, 2),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.transparent,
                            ),
                            child: InkWell(
                              onTap: () {
                                // push to photoView
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PhotoViewer(
                                      page: index,
                                      galleryItems:
                                          (state as SuccessGalleryStates)
                                                  .gallery ??
                                              [],
                                    ),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: NetworkImageWidget(
                                  imageLink: cubit.galleryList[index] ?? '',
                                  onErrorWidget: kNetworkImageOnErrorWidget,
                                  height: 100.w,
                                  width: 0.9.sw,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          childCount: cubit.galleryList.length,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
