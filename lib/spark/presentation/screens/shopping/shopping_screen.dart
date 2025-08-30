import 'package:zone/core/managers/route_manager.dart';
import 'package:zone/core/widgets/activity_item.dart';
import 'package:zone/spark/presentation/cubit/store/store_cubit.dart';
import 'package:zone/spark/presentation/cubit/store/store_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/consts/text_styles.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        isBack: true,
        title: 'المتجر',
        isWithImage: false,
        titleFontSize: 20.sp,
        appBarHeight: 79.h,
        textColor: LightColors.black,
        backButtonBackgroundColor: LightColors.black,
        backgroundColor: LightColors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(9.0.r),
        child: BlocConsumer<StoreCubit, StoreStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final storeCubit = StoreCubit.get(context);

            return GridView.builder(
              // Set padding and spacing between cards.
              padding: EdgeInsets.all(10.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // Set the aspect ratio of each card.
                childAspectRatio: 1.r,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              // Set the number of items in the grid view.
              itemCount: storeCubit.storeProductsList.length,
              itemBuilder: (BuildContext context, int index) {
                final storeProduct = storeCubit.storeProductsList[index];
                return Stack(
                  children: [
                    ShardCardItem(
                      padding: EdgeInsets.all(15.r),
                      width: 0.2.sw,
                      height: 0.22.sh,
                      itemHeight: 0.17.sh,
                      backGroundColor: Colors.white,
                      getIdCallback: (int selectedStoreId) {
                        Navigator.of(context).pushNamed(Routes.shoppingDetails,
                            arguments: {'id': selectedStoreId});
                      },
                      imgUrl:
                          // gym carb image
                          storeProduct?.image ??
                              'https://nyangeculturalperformers.com/wp-content/uploads/2017/01/product_09.jpg',
                      price: storeProduct?.price,
                      activityTitle: storeProduct?.name ?? '',
                      id: storeProduct?.id ?? 0,
                    ),
                    // price
                    /*     PositionedDirectional(
                      end: 15,
                      top: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: LightColors.black,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          '${storeProduct?.price}',
                          style: TextStyle(
                            color: LightColors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),*/
                    PositionedDirectional(
                      top: 15.h,
                      end: 10.w,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 0.15.sw,
                        ),
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            '${storeProduct?.price} \n ${storeProduct?.priceUnit}' ??
                                '0',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.white_14.copyWith(
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              // Set the grid view to shrink wrap its contents.
              shrinkWrap: true,
            );
          },
        ),
      ),
    );
  }
}
