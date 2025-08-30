import 'package:zone/core/consts/text_styles.dart';
import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/failure_widget.dart';
import 'package:zone/spark/data/models/home_utils_model.dart';
import 'package:zone/spark/presentation/cubit/store/store_deatails/store_details_cubit.dart';
import 'package:zone/spark/presentation/screens/home/widgets/home_slides.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/user_helper.dart';
import '../../../../core/managers/route_manager.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/header_image.dart';
import '../../../../core/widgets/show_price_card.dart';
import '../../../domain/entities/activity/activity_enrtity.dart';
import '../../../domain/entities/activity/activties_entity.dart';
import '../payment_page/payment_screen.dart';

class ShoppingDetailsScreen extends StatelessWidget {
  final int storeId;

  const ShoppingDetailsScreen({Key? key, required this.storeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
      builder: (context, state) {
        if (state is StoreDetailsLoadingState) {
          return Scaffold(
            body: showLoadingIndicator(),
          );
        }
        if (state is StoreDetailsErrorState) {
          body:
          Center(
            child: FailureWidget(
              message: state.message,
              onRetry: () {
                context.read<StoreDetailsCubit>().getStoreDetails(storeId);
              },
            ),
          );
        }
        if (state is StoreDetailsSuccessState) {
          final ActivityEntity storeEntity = state.storeDetails.activityEntity;
          final List<ActivitiesEntity> storesEntity =
              state.storeDetails.activitiesEntity;
          return Scaffold(
            appBar: HeaderWidget(
              title: storeEntity.name,
              appBarHeight: 79.h,
              titleFontSize: 20.sp,
              backgroundColor: LightColors.primary,
              isWithImage: true,
              serverImageLink: storeEntity.image,
              isBack: true,
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  HeaderImage(
                    imageFit: BoxFit.contain,
                    padding: EdgeInsets.symmetric(
                      horizontal: 90.w,
                      vertical: 10.h,
                    ),
                    serverImageLink: storeEntity.image,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.r, horizontal: 25.r),
                    child: Row(
                      children: [
                        ShowPriceButton(
                          price: storeEntity.price,
                        ),
                        const Spacer(),
                        (state.storeDetails.activityEntity.is_payment == 1) ? PaymentButton(url: state.storeDetails.activityEntity.payment_link ?? '', token: 'Bearer ${UserHelper.getUserToken()}') :const SizedBox(),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: SizedBox(
                      height: 0.25.sh,
                      child: SingleChildScrollView(
                        child: Text(
                          storeEntity.content,
                          textAlign: TextAlign.justify,
                          style: AppTextStyle.black_18BOLD.copyWith(
                            color: LightColors.black.withOpacity(.4),
                            fontSize: 17,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),


                  SizedBox(
                    width: 1.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26.w),
                          child: Text(
                            StringsAssetsConstants.more_store,
                            style: AppTextStyle.black_18BOLD.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  MoreSlidesWidget(
                    itemHeight: 0.16.sh,
                    imageFit: BoxFit.contain,
                    backGroundColor: Colors.white,
                    padding: EdgeInsets.all(15.r),
                    getIdCallback: (int selectedStoreId) {
                      Navigator.of(context).pushReplacementNamed(
                        Routes.shoppingDetails,
                        arguments: {'id': selectedStoreId},
                      );
                    },
                    model: storesEntity
                        .map(
                          (store) => HomeUtilsModel(
                            title: store.name,
                            image: store.image,
                            id: store.id,
                          ),
                        )
                        .toList(),
                    width: 0.33.sw,
                    height: 0.22.sh,
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
                context.read<StoreDetailsCubit>().getStoreDetails(storeId);
              },
            ),
          ),
        );
      },
    );
  }
}
